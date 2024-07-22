import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:petcure_user/controller/auth/register_screen_controller.dart';
import 'package:petcure_user/utils/colors.dart';
import 'package:petcure_user/utils/custom_text_style.dart';
import 'package:petcure_user/utils/validator.dart';
import 'package:petcure_user/views/auth/email_verification_screen.dart';
import 'package:petcure_user/views/auth/login_screen.dart';
import 'package:petcure_user/widgets/custom/custom_password_fields.dart';
import 'package:petcure_user/widgets/custom/custom_textfield.dart';
import 'package:petcure_user/widgets/custom/elevated_button.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  static const String routeName = "/register";
  final c = Get.put(RegisterScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
            key: c.formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child:
                          Text("Sign Up", style: CustomTextStyles.f32W600())),
                  const SizedBox(height: 3),
                  Center(
                    child: Text("Create your account",
                        style: CustomTextStyles.f16W400()),
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                      controller: c.fullNameController,
                      validator: Validators.checkFieldEmpty,
                      hint: "Enter your Full Name",
                      preIconPath: Icons.person,
                      preIconSize: 22,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text),
                  const SizedBox(height: 25),
                  CustomTextField(
                      controller: c.emailController,
                      validator: Validators.checkEmailField,
                      hint: "Enter your Email",
                      preIconPath: Icons.email,
                      preIconSize: 18,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.emailAddress),
                  const SizedBox(height: 25),
                  CustomTextField(
                      controller: c.addressController,
                      validator: Validators.checkFieldEmpty,
                      hint: "Enter your Address",
                      preIconPath: Icons.house_sharp,
                      preIconSize: 21,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text),
                  const SizedBox(height: 25),
                  IntlPhoneField(
                    controller: c.phoneNoController,
                    decoration: InputDecoration(
                      hintText: "Enter Phone No",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.secondaryTextColor),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.errorColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.primaryColor),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.errorColor),
                      ),
                      hintStyle: CustomTextStyles.f16W400(
                          color: AppColors.secondaryTextColor),
                    ),
                    style: CustomTextStyles.f16W400(
                      color: (AppColors.textColor),
                    ),
                    dropdownTextStyle: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    initialCountryCode: 'NP',
                    showDropdownIcon: false,
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  ),
                  Obx(
                    () => CustomPasswordField(
                      validator: Validators.checkPasswordField,
                      hint: "Enter Password",
                      eye: c.passwordObscure.value,
                      preIconSize: 17,
                      preIconPath: Icons.password,
                      onEyeClick: c.passwordOnEyeCLick,
                      controller: c.passwordController,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => CustomPasswordField(
                      validator: Validators.checkPasswordField,
                      hint: "Enter Confirm Password",
                      eye: c.confirmObscure.value,
                      preIconPath: Icons.password,
                      preIconSize: 17,
                      onEyeClick: c.confirmPasswordOnEyeCLick,
                      controller: c.confirmPasswordController,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Obx(
                            () => Checkbox(
                              checkColor: Colors.white,
                              fillColor: WidgetStateProperty.all(
                                  c.isChecked.value
                                      ? AppColors.primaryColor
                                      : AppColors.extraWhite),
                              value: c.isChecked.value,
                              onChanged: (bool? value) {
                                c.isChecked.value = value!;
                              },
                            ),
                          ),
                          SizedBox(
                            width: Get.width / 1.4,
                            child: Text(
                              "I agree with privacy policy",
                              style: CustomTextStyles.f14W400(
                                  color: AppColors.textColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  CustomElevatedButton(
                      title: "Sign Up",
                      onTap: () {
                        // //Get.offAll(()=>LogInScreen());
                        Get.offAll(() => EmailVerificationScreen());
                      }),
                  const SizedBox(height: 22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: CustomTextStyles.f14W400(),
                      ),
                      const SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                          Get.offAll(() => LoginScreen());
                        },
                        child: Text(
                          "Login",
                          style: CustomTextStyles.f14W400(
                              color: AppColors.primaryColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      )),
    );
  }
}
