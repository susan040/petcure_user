import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcure_user/utils/colors.dart';
import 'package:petcure_user/utils/custom_text_style.dart';
import 'package:petcure_user/utils/image_path.dart';
import 'package:petcure_user/views/dash_screen.dart';
import 'package:petcure_user/widgets/custom/elevated_button.dart';
import 'package:pinput/pinput.dart';

class EmailVerificationScreen extends StatelessWidget {
  static String routeName = "/email-verification_screen";
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: AppColors.extraWhite,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            Image.asset(ImagePath.verification),
            const SizedBox(height: 18),
            Text(
              "OTP Verification",
              style: CustomTextStyles.f32W600(),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: Get.width / 1.2,
              child: Text(
                "Thank you for registering with you. Please type the OTP as shared on your email address xxx@gmail.com",
                style: CustomTextStyles.f14W400(color: AppColors.lGrey),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 17),
            Pinput(
              length: 6, // Number of input fields
              defaultPinTheme: PinTheme(
                width: 40,
                height: 40,
                textStyle: CustomTextStyles.f14W400(),
                decoration: BoxDecoration(
                  color: AppColors.shimmerBase,

                  borderRadius: BorderRadius.circular(4), // Rounded corners
                ),
              ),
              focusedPinTheme: PinTheme(
                width: 40,
                height: 40,
                textStyle: CustomTextStyles.f14W400(),
                decoration: BoxDecoration(
                  color: AppColors.extraWhite,
                  border: Border.all(
                    width: 1.5,
                    color: AppColors.primaryColor, // Focused border color
                  ),
                  borderRadius: BorderRadius.circular(4), // Rounded corners
                ),
              ),
              onChanged: (pin) {
                print('Entered PIN: $pin');
              },
            ),
            const SizedBox(height: 20), // Space between Pinput and button
            InkWell(
              onTap: () {
                print('Resend code tapped');
                // Add your resend code logic here
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't get code?",
                    style: CustomTextStyles.f14W400(),
                  ),
                  const SizedBox(width: 5), // Space between Pinput and button

                  Text(
                    "Send",
                    style:
                        CustomTextStyles.f14W400(color: AppColors.primaryColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 20),
        child: SizedBox(
          height: 55,
          child: CustomElevatedButton(
              title: "Submit",
              onTap: () {
                Get.offAll(() => DashScreen());
              }),
        ),
      ),
    );
  }
}
