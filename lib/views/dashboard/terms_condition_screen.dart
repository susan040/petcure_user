import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcure_user/utils/colors.dart';
import 'package:petcure_user/utils/custom_text_style.dart';

class TermsConditionScreen extends StatelessWidget {
  const TermsConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        elevation: 2,
        centerTitle: false,
        backgroundColor: AppColors.extraWhite,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text("Terms and Conditions",
            style: CustomTextStyles.f16W600(color: AppColors.textColor)),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 18, right: 18, top: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Terms and Conditions", style: CustomTextStyles.f18W600()),
            const SizedBox(height: 10),
            Text(
              "Welcome to PetCure. By using our app, you agree to the following terms and conditions:",
              style: CustomTextStyles.f14W400(),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 14),
            Text("1. Acceptance of Terms", style: CustomTextStyles.f18W600()),
            const SizedBox(height: 10),
            Text(
              "By accessing or using Pet Cure, you agree to be bound by these Terms and Conditions and our Privacy Policy. If you do not agree, you may not use the app.",
              style: CustomTextStyles.f14W400(),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 14),
            Text("2. Services Provided", style: CustomTextStyles.f18W600()),
            const SizedBox(height: 10),
            Text(
              "Pet Cure provides information, advice, and tools related to pet care and veterinary services. The information provided is for general informational purposes only and does not replace professional veterinary advice.",
              style: CustomTextStyles.f14W400(),
              textAlign: TextAlign.justify,
            ),
            Text("3. User Responsibilities", style: CustomTextStyles.f18W600()),
            const SizedBox(height: 10),
           
            Text(
              "",
              style: CustomTextStyles.f14W400(),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 14),
            
          ],
        ),
      ),
    );
  }
}