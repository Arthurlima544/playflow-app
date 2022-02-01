import 'package:flutter/material.dart';
import 'package:myapp/Pages/HomePage.dart';
import 'package:myapp/Pages/login/LoginPage.dart';
import 'package:myapp/Pages/SplashPage.dart';

var routes = <String, WidgetBuilder>{
  '/splashPage': (context) => SplashPage(),
  '/loginPage': (context) => LoginPage(),
  '/homePage': (context) => HomePage(),
};
