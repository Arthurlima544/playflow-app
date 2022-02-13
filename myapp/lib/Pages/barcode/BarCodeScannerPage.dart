import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:myapp/Pages/barcode/BarCodeScannerController.dart';
import 'package:myapp/Pages/barcode/BarCodeScannerProvider.dart';
import 'package:myapp/shared/Components/botton_sheet/BottonSheetWidget.dart';
import 'package:myapp/shared/Components/divider_vertical/DividerVerticalWidget.dart';
import 'package:myapp/shared/Components/label_button/LabelButton.dart';
import 'package:myapp/shared/Components/set_label_buttons/SetLabelButtons.dart';
import 'package:myapp/shared/theme/AppColors.dart';
import 'package:myapp/shared/theme/AppTextStyles.dart';

class BarCodeScannerPage extends StatefulWidget {
  final List<CameraDescription> cameras;

  BarCodeScannerPage({Key? key, required this.cameras}) : super(key: key);

  @override
  State<BarCodeScannerPage> createState() => _BarCodeScannerPageState();
}

class _BarCodeScannerPageState extends State<BarCodeScannerPage> {
  BarCodeScannerController controller = BarCodeScannerController();

  @override
  void dispose() {
    controller.disposeCamera();
    controller.closeScanner();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /* return BottonSheetWidget(
        primarylabel: "Escanear novamente",
        primaryOnPressed: () {},
        secondarylabel: "Digitar Código",
        secondaryOnPressed: () {},
        title: "não",
        subtitle: "Tente"); */

    return SafeArea(
      bottom: true,
      left: true,
      right: true,
      top: true,
      child: Stack(
        children: [
          ValueListenableBuilder(
              valueListenable: controller,
              builder: (context, value, child) {
                switch (value) {
                  case BarcodeScannerStatus.noState:
                    controller.initCamera();
                    return Text("no State");
                  case BarcodeScannerStatus.initialize:
                    print("cameraInitialize");
                    return Container(
                      child: controller.cameraController.buildPreview(),
                      color: Colors.blue,
                    );
                  case BarcodeScannerStatus.error:
                    print("Erro ao inicializar");
                    return Text("Error");
                  case BarcodeScannerStatus.loading:
                    print("loading");
                    return Container(
                      child: controller.cameraController.buildPreview(),
                      color: Colors.blue,
                    );

                  default:
                    print("defalut");
                    return Text("defalut");
                }
              }),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.black,
                centerTitle: true,
                title: Text(
                  "Escaneie seu código de barra",
                  style: TextStyles.buttonBackground,
                ),
                leading: const BackButton(
                  color: AppColors.background,
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: SetLabelButtons(
                primaryOnPressed: () {},
                secondaryOnPressed: () {},
                secondarylabel: "Adicionar da Galeria",
                primarylabel: "Insira o código do boleto",
              ),
            ),
          ),
        ],
      ),
    );

    return Material(child: Center(child: CircularProgressIndicator()));
  }
}

/* class ButtonsAndStuff extends StatelessWidget {
  const ButtonsAndStuff({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
  }
}
 */