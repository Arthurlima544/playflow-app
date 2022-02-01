import 'package:flutter/material.dart';
import 'package:myapp/shared/Components/botton_sheet/BottonSheetWidget.dart';
import 'package:myapp/shared/Components/divider_vertical/DividerVerticalWidget.dart';
import 'package:myapp/shared/Components/label_button/LabelButton.dart';
import 'package:myapp/shared/Components/set_label_buttons/SetLabelButtons.dart';
import 'package:myapp/shared/theme/AppColors.dart';
import 'package:myapp/shared/theme/AppTextStyles.dart';

class BarCodeScannerPage extends StatefulWidget {
  BarCodeScannerPage({Key? key}) : super(key: key);

  @override
  State<BarCodeScannerPage> createState() => _BarCodeScannerPageState();
}

class _BarCodeScannerPageState extends State<BarCodeScannerPage> {
  @override
  Widget build(BuildContext context) {
    return BottonSheetWidget(
        primarylabel: "Escanear novamente",
        primaryOnPressed: () {},
        secondarylabel: "Digitar Código",
        secondaryOnPressed: () {},
        title: "não",
        subtitle: "Tente");
    return RotatedBox(
      quarterTurns: 1,
      child: SafeArea(
        bottom: true,
        left: true,
        right: true,
        top: true,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              "Escaneie seu código de barra",
              style: TextStyles.buttonBackground,
            ),
            leading: BackButton(
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
                flex: 2,
                child: Container(
                  color: Colors.white,
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
    );
  }
}
