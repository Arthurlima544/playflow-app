import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:google_fonts/google_fonts.dart';

void appFlavor() {
  FlavorConfig(
    name: "DEV",
    variables: {
      "theme": ThemeData(
          backgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromRGBO(255, 148, 25, 1),
          ),
          textTheme: TextTheme(
            headline4: GoogleFonts.lexend(),
            headline6: GoogleFonts.inter(),
          )),
    },
  );
}
