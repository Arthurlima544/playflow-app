import 'package:flutter/material.dart';
import 'package:myapp/Pages/LoginPage.dart';
import 'package:myapp/Pages/SplashPage.dart';

var routes = <String, WidgetBuilder>{
  '/splashPage': (context) => const SplashPage(),
  '/loginPage': (context) => const LoginPage(),
};
