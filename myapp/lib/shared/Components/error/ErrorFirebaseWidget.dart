import 'package:flutter/material.dart';

class ErrorFirebaseWidget extends StatelessWidget {
  const ErrorFirebaseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: Text("Não foi possivel conectar ao Firebase"),
      ),
    );
  }
}
