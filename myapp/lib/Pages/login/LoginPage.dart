import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myapp/Pages/login/LoginController.dart';
import 'package:myapp/shared/Components/social_login/SocialLoginButton.dart';
import 'package:myapp/shared/theme/AppColors.dart';
import 'package:myapp/shared/theme/AppImages.dart';
import 'package:myapp/shared/theme/AppTextStyles.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final LoginController loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.36,
              color: AppColors.primary,
            ),
            // TODO: Porque a imagem está fixa em um só ponto ?
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Image.asset(
                AppImages.person,
                width: 208,
                height: 373,
              ),
            ),
            Positioned(
              bottom: size.height * 0.1,
              right: 0,
              left: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppImages.logomini),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 70, right: 70, top: 30),
                    child: Text(
                      "Organize seus boletos em um só lugar",
                      textAlign: TextAlign.center,
                      style: TextStyles.titleHome,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 40, top: 40),
                    child: SocialLoginButton(
                      onTap: () {
                        loginController.handleSignIn(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
