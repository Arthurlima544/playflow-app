import 'package:flutter/material.dart';
import 'package:myapp/Pages/LoginPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return LoginPage();
            }));
          },
          child: const Center(
            child: Image(image: AssetImage("assets/PayFlow.png")),
          ),
        ),
      ),
    );
  }
}
