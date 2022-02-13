import 'package:flutter/material.dart';
import 'package:myapp/shared/Components/divider_vertical/DividerVerticalWidget.dart';
import 'package:myapp/shared/Components/label_button/LabelButton.dart';
import 'package:myapp/shared/theme/AppColors.dart';

class SetLabelButtons extends StatelessWidget {
  final String primarylabel;
  final VoidCallback primaryOnPressed;
  final String secondarylabel;
  final VoidCallback secondaryOnPressed;
  const SetLabelButtons(
      {Key? key,
      required this.primarylabel,
      required this.primaryOnPressed,
      required this.secondarylabel,
      required this.secondaryOnPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      height: 56,
      child: Row(
        children: [
          Expanded(
            child: LabelButton(
              label: primarylabel,
              onPressed: primaryOnPressed,
            ),
          ),
          DividerVerticalWidget(),
          Expanded(
            child: LabelButton(
              label: secondarylabel,
              onPressed: secondaryOnPressed,
            ),
          )
        ],
      ),
    );
  }
}
