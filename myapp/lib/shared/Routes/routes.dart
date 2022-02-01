import 'package:flutter/material.dart';
import 'package:myapp/Pages/LoginPage.dart';
import 'package:myapp/Pages/SplashPage.dart';

var routes = <String, WidgetBuilder>{
  '/splashPage': (context) => SplashPage(),
  '/loginPage': (context) => LoginPage(),
};
