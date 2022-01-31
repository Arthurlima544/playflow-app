import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:myapp/shared/AppFlavor.dart';
import 'package:myapp/shared/consts/DisableBottonBar.dart';
import 'package:myapp/shared/consts/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  disableBottomBarAndTopBar();
  appFlavor();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      routes: routes,
      initialRoute: '/homePage',
      theme: FlavorConfig.instance.variables["theme"],
      debugShowCheckedModeBanner: false,
    );
  }
}
