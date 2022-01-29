import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(350.0),
          child: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false, // hides leading widget
          )),
      body: Container(
        child: Text("sei la"),
      ),
    );
  }
}
