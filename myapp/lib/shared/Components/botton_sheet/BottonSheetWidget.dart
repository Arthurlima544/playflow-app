import 'package:flutter/material.dart';
import 'package:myapp/shared/Components/set_label_buttons/SetLabelButtons.dart';
import 'package:myapp/shared/theme/AppColors.dart';
import 'package:myapp/shared/theme/AppTextStyles.dart';

class BottonSheetWidget extends StatelessWidget {
  final String primarylabel;
  final VoidCallback primaryOnPressed;
  final String secondarylabel;
  final VoidCallback secondaryOnPressed;
  final String title;
  final String subtitle;

  const BottonSheetWidget(
      {Key? key,
      required this.primarylabel,
      required this.primaryOnPressed,
      required this.secondarylabel,
      required this.secondaryOnPressed,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RotatedBox(
        quarterTurns: 1,
        child: Material(
          child: Container(
            color: AppColors.shape,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40),
                      child: Text.rich(
                        TextSpan(
                            text: title,
                            style: TextStyles.buttonBoldHeading,
                            children: [
                              TextSpan(
                                  text: "\n$subtitle",
                                  style: TextStyles.buttonHeading)
                            ]),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      height: 1,
                      color: AppColors.stroke,
                    ),
                    SetLabelButtons(
                        primarylabel: primarylabel,
                        primaryOnPressed: primaryOnPressed,
                        secondarylabel: secondarylabel,
                        secondaryOnPressed: secondaryOnPressed)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
