import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

import '../../main.dart';

enum BarcodeScannerStatus { initialize, loaded, loading, error, noState }

class BarCodeScannerController extends ValueNotifier<BarcodeScannerStatus> {
  BarCodeScannerController() : super(BarcodeScannerStatus.noState);
  CameraController cameraController = CameraController(
      cameras[0], ResolutionPreset.low,
      imageFormatGroup: ImageFormatGroup.yuv420);
  final barcodeScanner = GoogleMlKit.vision.barcodeScanner();

  void initCamera() async {
    await cameraController.initialize();

    value = cameraController.value.isInitialized
        ? BarcodeScannerStatus.initialize
        : BarcodeScannerStatus.error;
    if (value == BarcodeScannerStatus.initialize) {
      startStreaming();
    }
  }

  void startStreaming() async {
    if (value == BarcodeScannerStatus.initialize) {
      value = BarcodeScannerStatus.loading;
      try {
        Future.delayed(Duration(seconds: 2));
        cameraController.startImageStream((image) async {
          InputImage inputImage = cameraImageToInputImage(image);

          String? result = await startScanning(inputImage);
          if (result != null) {
            cameraController.stopImageStream();
            disposeCamera();
            print("${result}");
          }
        });
      } on CameraException catch (e) {
        print(e.description);
      }
    } else {
      initCamera();
    }
  }

  Future<String?> startScanning(InputImage inputImage) async {
    var barcode;

    final List<Barcode> barcodes =
        await barcodeScanner.processImage(inputImage);

    for (Barcode item in barcodes) {
      barcode = item.value.displayValue;
    }
    if (barcode != null) {
      disposeCamera();
      closeScanner();
      return barcode;
    }

    return null;
  }

  InputImage cameraImageToInputImage(CameraImage image) {
    final WriteBuffer allBytes = WriteBuffer();
    for (Plane plane in image.planes) {
      allBytes.putUint8List(plane.bytes);
    }
    final bytes = allBytes.done().buffer.asUint8List();

    final Size imageSize =
        Size(image.width.toDouble(), image.height.toDouble());

    const InputImageRotation imageRotation = InputImageRotation.Rotation_0deg;

    final InputImageFormat inputImageFormat =
        InputImageFormatMethods.fromRawValue(image.format.raw) ??
            InputImageFormat.NV21;

    final planeData = image.planes.map(
      (Plane plane) {
        return InputImagePlaneMetadata(
          bytesPerRow: plane.bytesPerRow,
          height: plane.height,
          width: plane.width,
        );
      },
    ).toList();

    final inputImageData = InputImageData(
      size: imageSize,
      imageRotation: imageRotation,
      inputImageFormat: inputImageFormat,
      planeData: planeData,
    );
    final inputImage =
        new InputImage.fromBytes(bytes: bytes, inputImageData: inputImageData);

    return inputImage;
  }

  void disposeCamera() => cameraController.dispose();
  void closeScanner() async => await barcodeScanner.close();
}
