import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed("/loginPage");
          },
          child: const Center(
            child: Image(image: AssetImage("assets/PayFlow.png")),
          ),
        ),
      ),
    );
  }
}
