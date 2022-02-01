import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:myapp/shared/consts/DisableBottonBar.dart';
import 'package:myapp/shared/Routes/routes.dart';

import 'shared/Components/error/ErrorFirebaseWidget.dart';
import 'shared/Components/loading/LoadingWidget.dart';
import 'shared/consts/SetOrientations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  disableBottomBarAndTopBar();
  setOrientations();
  runApp(const AppFirebase());
}

class AppFirebase extends StatefulWidget {
  const AppFirebase({Key? key}) : super(key: key);

  @override
  State<AppFirebase> createState() => _AppFirebaseState();
}

class _AppFirebaseState extends State<AppFirebase> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const ErrorFirebaseWidget();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: "My App",
            routes: routes,
            initialRoute: '/splashPage',
            debugShowCheckedModeBanner: false,
          );
        }
        return const LoadingWidget();
      },
    );
    /*  */
  }
}
