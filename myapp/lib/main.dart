import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/DisableBottonBar.dart';

import 'Pages/HomePage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  disableBottomBarAndTopBar();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: HomePage(),
      theme: ThemeData(
          backgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromRGBO(255, 148, 25, 1),
          ),
          textTheme: TextTheme(
            headline4: GoogleFonts.lexend(),
            headline6: GoogleFonts.inter(),
          )),
      debugShowCheckedModeBanner: false,
    );
  }
}
