import 'package:flutter/material.dart';

class AppBarContainer extends StatelessWidget {
  final Color? backgroundColor;
  final Color? progressColor;
  final double progress;
  final double width;
  final double height;

  const AppBarContainer({
    this.backgroundColor = Colors.grey,
    this.progressColor = Colors.red,
    required this.progress,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            Container(
              color: backgroundColor,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: height * progress,
                color: progressColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
