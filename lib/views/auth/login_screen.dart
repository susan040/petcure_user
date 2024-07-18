import 'package:flutter/material.dart';
import 'package:petcure_user/utils/custom_text_style.dart';
import 'package:petcure_user/widgets/custom/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  static String routName = "/login_screen";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 100),
          child: Column(
            children: [
              Text(
                "Welcome Back",
                style: CustomTextStyles.f32W600(),
              ),
              Text(
                "Enter your credential to login",
                style: CustomTextStyles.f14W400(),
              ),
              CustomTextField(
                  preIconPath: Icons.email,
  
                  hint: "Email",
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.emailAddress)
            ],
          ),
        ),
      )),
    );
  }
}
