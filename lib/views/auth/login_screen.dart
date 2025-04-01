import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcure_user/controller/auth/login_screen_controller.dart';
import 'package:petcure_user/utils/colors.dart';
import 'package:petcure_user/utils/custom_text_style.dart';
import 'package:petcure_user/utils/validator.dart';
import 'package:petcure_user/views/auth/register_screen.dart';
import 'package:petcure_user/widgets/custom/custom_password_fields.dart';
import 'package:petcure_user/widgets/custom/custom_textfield.dart';
import 'package:petcure_user/widgets/custom/elevated_button.dart';

class LoginScreen extends StatelessWidget {
  static String routName = "/login_screen";
  final c = Get.put(LoginScreenController());
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, top: 100),
            child: Form(
              key: c.key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Welcome Back",
                      style: CustomTextStyles.f32W600(),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Enter your credential to login",
                      style: CustomTextStyles.f14W400(),
                    ),
                  ),
                  const SizedBox(height: 35),
                  CustomTextField(
                      validator: Validators.checkEmailField,
                      controller: c.emailController,
                      preIconPath: Icons.email,
                      preIconSize: 18,
                      hint: "Enter your Email",
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.none,
                      textInputType: TextInputType.emailAddress),
                  const SizedBox(height: 15),
                  Obx(() => CustomPasswordField(
                      validator: Validators.checkPasswordField,
                      hint: "Enter your password",
                      preIconPath: Icons.password,
                      preIconSize: 17,
                      eye: c.passwordObscure.value,
                      onEyeClick: c.onEyeCLick,
                      controller: c.passwordController,
                      textInputAction: TextInputAction.done)),
                  const SizedBox(height: 10),
                  Text(
                    "Forget Password?",
                    style: CustomTextStyles.f14W400(color: AppColors.textColor),
                  ),
                  const SizedBox(height: 25),
                  CustomElevatedButton(
                      title: "Login",
                      onTap: () {
                        c.onSubmit();
                      }),
                  const SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: CustomTextStyles.f14W400(),
                      ),
                      const SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                          Get.offAll(() => RegisterScreen());
                        },
                        child: Text(
                          "Sign Up",
                          style: CustomTextStyles.f14W400(
                              color: AppColors.primaryColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
