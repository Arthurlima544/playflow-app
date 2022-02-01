import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myapp/shared/auth/AuthController.dart';

class LoginController {
  AuthController authController = AuthController();
  Future<void> handleSignIn(BuildContext context) async {
    final GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      final response = await _googleSignIn.signIn();
      authController.setUser(context, response);
      print(response);
    } catch (error) {
      authController.setUser(context, null);
      print(error);
    }
  }
}
