import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:myapp/main.dart';

class BarCodeScannerProvider {
  final CameraController cameraController;
  final barcodeScanner = GoogleMlKit.vision.barcodeScanner();

  BarCodeScannerProvider(this.cameraController);

  getAll() async {
    if (cameraController.value.isInitialized) {
      cameraController.startImageStream((cameraImage) {
        final WriteBuffer allBytes = WriteBuffer();
        for (Plane plane in cameraImage.planes) {
          allBytes.putUint8List(plane.bytes);
        }
        final bytes = allBytes.done().buffer.asUint8List();

        final Size imageSize =
            Size(cameraImage.width.toDouble(), cameraImage.height.toDouble());

        const InputImageRotation imageRotation =
            InputImageRotation.Rotation_0deg;

        final InputImageFormat inputImageFormat =
            InputImageFormatMethods.fromRawValue(cameraImage.format.raw) ??
                InputImageFormat.NV21;

        final planeData = cameraImage.planes.map(
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
            InputImage.fromBytes(bytes: bytes, inputImageData: inputImageData);
        detector(inputImage);
      });
    }
  }

  detector(InputImage inputImage) async {
    final List<Barcode> barcodes =
        await barcodeScanner.processImage(inputImage);
    extractor(barcodes);
  }

  extractor(List<Barcode> barcodes) {
    for (Barcode barcode in barcodes) {
      final BarcodeType type = barcode.type;
      final Rect? boundingBox = barcode.value.boundingBox;
      final String? displayValue = barcode.value.displayValue;
      final String? rawValue = barcode.value.rawValue;

      print("$type      $boundingBox      $displayValue       $rawValue");

      switch (type) {
        case BarcodeType.wifi:
          BarcodeWifi barcodeWifi = barcode.value as BarcodeWifi;
          break;
        case BarcodeType.url:
          BarcodeUrl barcodeUrl = barcode.value as BarcodeUrl;
          break;
        default:
          Barcode unknown = barcode.value as Barcode;
      }
    }
  }

  dispose() {
    cameraController.stopImageStream();
    cameraController.dispose();
    barcodeScanner.close();
  }
}
