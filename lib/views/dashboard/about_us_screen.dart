import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcure_user/utils/colors.dart';
import 'package:petcure_user/utils/custom_text_style.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

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
        title: Text("About Us",
            style: CustomTextStyles.f16W600(color: AppColors.textColor)),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 18, right: 18, top: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("About Pet Care", style: CustomTextStyles.f18W600()),
            const SizedBox(height: 10),
            Text(
              "Welcome to Pet Care! At Pet Care, we know that pets are family, and we’re dedicated to providing the best care and products to keep your furry friends happy and healthy. Our app is designed by a passionate team of veterinarians, pet care specialists, and tech enthusiasts who strive to create a comprehensive and user-friendly experience. With Pet Care, you can easily book appointments with trusted vets, groomers, and trainers, ensuring your pet gets the care they need. Additionally, we offer a curated selection of high-quality pet products, including food, clothing, toys, and accessories, so you can find everything your pet needs in one place.",
              style: CustomTextStyles.f14W400(),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 14),
            Text(
              "Our commitment extends beyond just products and services; we aim to build a supportive community where pet owners can connect, share stories, and access valuable pet care tips and advice. We prioritize continuous improvement, regularly updating our app based on user feedback and the latest advancements in pet care. Join the Pet Care family today and experience how we can help you provide the best care for your beloved pets, making pet ownership as rewarding and stress-free as possible.",
              style: CustomTextStyles.f14W400(),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
