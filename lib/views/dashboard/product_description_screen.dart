import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcure_user/controller/dashboard/product_desc_controller.dart';
import 'package:petcure_user/utils/colors.dart';
import 'package:petcure_user/utils/custom_text_style.dart';

class ProductDescriptionScreen extends StatelessWidget {
  static String routeName = "/product-description-screen";
  final ProductDescController controller = Get.put(ProductDescController());

  ProductDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text("Description",
            style: CustomTextStyles.f16W600(color: AppColors.textColor)),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: 300,
            child: PageView.builder(
              onPageChanged: (index) {
                controller.updatePageIndex(index);
              },
              itemCount: controller.images.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Image.asset(
                    controller.images[index], // Load images from controller
                    width: 200, // Adjust width as needed
                    height: 270,
                    fit: BoxFit.fill,
                  ),
                );
              },
            ),
          ),
          const SizedBox(
              height: 16), // Add some space between the PageView and dots

          Obx(() {
            int currentPage = controller.currentPage.value;
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(controller.images.length, (index) {
                return Dot(isActive: index == currentPage);
              }),
            );
          }),
        ],
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final bool isActive;

  const Dot({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      width: isActive ? 12.0 : 8.0,
      height: isActive ? 12.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryColor : AppColors.secondaryColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
