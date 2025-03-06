import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:petcure_user/controller/dashboard/summary_screen_controller.dart';
import 'package:petcure_user/utils/colors.dart';
import 'package:petcure_user/utils/custom_text_style.dart';
import 'package:petcure_user/utils/image_path.dart';
import 'package:petcure_user/views/dashboard/booked_success_screen.dart';
import 'package:petcure_user/views/dashboard/home_screen.dart';
import 'package:petcure_user/widgets/custom/elevated_button.dart';

class SummaryScreen extends StatelessWidget {
  SummaryScreen({super.key});
  final controller = Get.put(SummaryScreenController());

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
        title: Text("Summary",
            style: CustomTextStyles.f16W600(color: AppColors.textColor)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          // const DoctorWidget(),
          Padding(
            padding:
                const EdgeInsets.only(left: 18, right: 18, top: 18, bottom: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Date", style: CustomTextStyles.f14W600()),
                Text("2080/11/26", style: CustomTextStyles.f14W400()),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, bottom: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sub Total", style: CustomTextStyles.f14W600()),
                Text("Rs.15000.00", style: CustomTextStyles.f14W400()),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, bottom: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("VAT Charge", style: CustomTextStyles.f14W600()),
                Text("Rs.1350.00", style: CustomTextStyles.f14W400()),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 14),
            child: Divider(thickness: 0.5, color: AppColors.lGrey),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Amount:", style: CustomTextStyles.f14W600()),
                Text("Rs.1650.00", style: CustomTextStyles.f14W400()),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: Text("Select Payment Method",
                style: CustomTextStyles.f16W600()),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 18, right: 18, top: 14, bottom: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() {
                  return PaymentMethodWidget(
                    iconPath: ImagePath.khalti,
                    isSelected:
                        controller.selectedPaymentMethod.value == 'khalti',
                    onTap: () => controller.selectPaymentMethod('khalti'),
                  );
                }),
                const SizedBox(
                    width: 10), // Add some spacing between the two containers
                Obx(() {
                  return PaymentMethodWidget(
                    iconPath: ImagePath.esewa,
                    isSelected:
                        controller.selectedPaymentMethod.value == 'esewa',
                    onTap: () => controller.selectPaymentMethod('esewa'),
                  );
                }),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 18, right: 18, top: 14, bottom: 14),
        child: CustomElevatedButton(
            title: "Continue",
            onTap: () {
              Get.offAll(() => BookedSuccessScreen());
            }),
      ),
    );
  }
}

class PaymentMethodWidget extends StatelessWidget {
  final String iconPath;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentMethodWidget({
    super.key,
    required this.iconPath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70,
        width: Get.width / 2.3,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryColor.withOpacity(0.1)
              : AppColors.extraWhite,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: isSelected
                ? AppColors.primaryColor
                : AppColors.primaryColor.withOpacity(0.4),
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 24,
              width: 24,
              margin: const EdgeInsets.only(left: 14, top: 8, bottom: 8),
              decoration: BoxDecoration(
                color:
                    isSelected ? AppColors.primaryColor : AppColors.extraWhite,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  width: 1,
                  color: AppColors.primaryColor,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check, color: Colors.white, size: 16)
                  : null,
            ),
            const SizedBox(width: 12),
            SvgPicture.asset(iconPath),
          ],
        ),
      ),
    );
  }
}
