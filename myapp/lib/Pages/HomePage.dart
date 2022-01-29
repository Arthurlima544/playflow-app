import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            print("GO TO NEXT PAGE");
          },
          child: const Center(
            child: Image(image: AssetImage("assets/PayFlow.png")),
          ),
        ),
      ),
    );
  }
}
