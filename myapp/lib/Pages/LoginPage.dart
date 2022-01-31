import 'package:flutter/material.dart';

import 'components/AppBarContainer.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                AppBarContainer(
                  progress: 0.5,
                  height: 600,
                  width: MediaQuery.of(context).size.width,
                  backgroundColor:
                      Theme.of(context).appBarTheme.backgroundColor,
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
              ],
            ),
            Positioned(
              bottom: 0,
              left: 65.45,
              child: SizedBox(
                height: 80,
                width: 300,
                child: TextButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(3),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey[200]),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    print("OIIIII");
                  },
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Align(
                          alignment: AlignmentDirectional.center,
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Image(
                                image: AssetImage('assets/google_icon.png')),
                          )),
                      const SizedBox(
                        width: 50,
                      ),
                      Positioned(
                          right: 30,
                          child: Text(
                            "Entrar com Google",
                            style: Theme.of(context).textTheme.headline6,
                          ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
/* 
style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 20),
                  ),

*/