import 'package:flutter/material.dart';

import 'components/AppBarContainer.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: Container(
        child: Column(
          children: [
            Stack(children: [
              AppBarContainer(
                progress: 0.5,
                height: 600,
                width: MediaQuery.of(context).size.width,
                backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                progressColor: Theme.of(context).backgroundColor,
              ),
              const Positioned(
                child: Image(image: AssetImage("assets/woman.png")),
                bottom: 189,
                left: 118.85,
              ),
              Positioned(
                width: MediaQuery.of(context).size.width / 1.5,
                bottom: 50,
                left: 65.45,
                child: Text(
                  "Organize seus boletos em um só lugar",
                  style: Theme.of(context).textTheme.headline4,
                  overflow: TextOverflow.visible,
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
