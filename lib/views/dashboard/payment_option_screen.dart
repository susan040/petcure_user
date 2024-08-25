import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:petcure_user/controller/dashboard/shop_screen_controller.dart';
import 'package:petcure_user/utils/colors.dart';
import 'package:petcure_user/utils/custom_text_style.dart';
import 'package:petcure_user/utils/image_path.dart';
import 'package:petcure_user/views/dashboard/order_success_screen.dart';
import 'package:petcure_user/widgets/custom/elevated_button.dart';

class PaymentOptionScreen extends StatelessWidget {
  static String routeName = "/payment-option-screen";
  final c = Get.put(ShopScreenController());
  PaymentOptionScreen({super.key});

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
        title: Text("Select Payment Method",
            style: CustomTextStyles.f16W600(color: AppColors.textColor)),
      ),
      body: Column(
        children: [
          Obx(() => PaymentButton(
              image: ImagePath.khalti,
              isSelected: c.selectedPayment.value == 'khalti',
              onTap: () {
                c.updateSelectedPayment("khalti");
              })),
          Obx(() => PaymentButton(
              image: ImagePath.esewa,
              isSelected: c.selectedPayment.value == 'esewa',
              onTap: () {
                c.updateSelectedPayment("esewa");
              })),
          // Obx(() => PaymentButton(
          //     image: ImagePath.imepay,
          //     isSelected: c.selectedPayment.value == 'imepay',
          //     onTap: () {
          //       c.updateSelectedPayment("imepay");
          //     })),
        ],
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 18, right: 18, bottom: 12, top: 10),
        child: CustomElevatedButton(
            title: "Continue",
            onTap: () {
              Get.offAll(() => OrderSuccessScreen());
            }),
      ),
    );
  }
}

class PaymentButton extends StatelessWidget {
  const PaymentButton({
    super.key,
    required this.image,
    required this.isSelected,
    required this.onTap,
  });

  final bool isSelected;
  final String image;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 18, right: 18, top: 14),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : Colors.grey,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(image),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? AppColors.primaryColor : Colors.grey,
                  ),
                ),
                child: Center(
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primaryColor : Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
