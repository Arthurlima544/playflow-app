import 'package:flutter/material.dart';
import 'package:myapp/shared/auth/AuthController.dart';
import 'package:myapp/shared/theme/AppColors.dart';
import 'package:myapp/shared/theme/AppImages.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = AuthController();
    authController.currentUser(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Center(child: Image.asset(AppImages.union)),
          Center(child: Image.asset(AppImages.logoFull))
        ],
      ),
    );
  }
}
