import 'package:flutter/material.dart';
import 'package:myapp/Pages/HomePage.dart';
import 'package:myapp/Pages/LoginPage.dart';

var routes = <String, WidgetBuilder>{
  '/homePage': (context) => HomePage(),
  '/loginPage': (context) => LoginPage(),
};
