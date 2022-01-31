import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/AppFlavor.dart';
import 'package:myapp/DisableBottonBar.dart';

import 'Pages/HomePage.dart';

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
      home: HomePage(),
      theme: FlavorConfig.instance.variables["theme"],
      debugShowCheckedModeBanner: false,
    );
  }
}
