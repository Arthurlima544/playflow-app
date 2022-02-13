import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/Pages/barcode/BarCodeScannerPage.dart';
import 'package:myapp/Pages/home/HomePage.dart';
import 'package:myapp/Pages/login/LoginPage.dart';
import 'package:myapp/Pages/SplashPage.dart';
import 'package:myapp/main.dart';

var routes = <String, WidgetBuilder>{
  '/splashPage': (context) => SplashPage(),
  '/loginPage': (context) => LoginPage(),
  '/homePage': (context) => HomePage(),
  '/barCodePage': (context) => BarCodeScannerPage(
        cameras: cameras,
      ),
};
