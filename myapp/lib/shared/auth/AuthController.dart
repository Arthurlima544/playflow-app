import 'package:flutter/material.dart';
import 'package:myapp/model/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  UserModel? _user;

  UserModel get user => _user!;

  void setUser(BuildContext context, UserModel? user) {
    if (user != null) {
      _user = user;
      saveUser(user);
      Navigator.of(context).pushReplacementNamed('/homePage');
    } else {
      Navigator.of(context).pushReplacementNamed('/loginPage');
    }
  }

  Future<void> saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString("user", user.toJson());
    return;
  }

  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 2));
    if (instance.containsKey("user")) {
      final json = instance.get("user") as String;
      setUser(context, UserModel.fromJson(json));
    }
    return;
  }
}
