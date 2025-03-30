import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcure_user/controller/dashboard/cart_screen_controller.dart';
import 'package:petcure_user/utils/colors.dart';
import 'package:petcure_user/utils/custom_text_style.dart';
import 'package:petcure_user/utils/image_path.dart';
import 'package:petcure_user/widgets/custom/elevated_button.dart';

class MyCartScreen extends StatelessWidget {
  static String routeName = "/my-cart-screen";
  final c = Get.put(MyCartScreenController());
  MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
          elevation: 2,
          centerTitle: false,
          backgroundColor: AppColors.extraWhite,
          title: Text("My Cart",
              style: CustomTextStyles.f14W600(color: AppColors.textColor)),
          actions: [
            InkWell(
              child: Padding(
                padding: const EdgeInsets.only(right: 18, top: 18),
                child: Text("Delete",
                    style: CustomTextStyles.f14W400(
                        color: AppColors.primaryColor)),
              ),
            )
          ]),
      body: Column(
        children: [
          const SizedBox(height: 20),
          MyCartWidget(c: c),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration:
            const BoxDecoration(color: AppColors.extraWhite, boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor,
            blurRadius: 7.0,
            offset: Offset(5, 5),
          )
        ]),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 18, right: 18, top: 12, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: c.toggleSelectionAll,
                    child: Obx(() => Container(
                        height: 18,
                        width: 18,
                        decoration: BoxDecoration(
                          color: AppColors.extraWhite,
                          border: Border.all(
                              width: 1,
                              color: c.isSelectedAll.value
                                  ? AppColors.primaryColor
                                  : AppColors.lGrey),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Container(
                            height: 12,
                            width: 12,
                            decoration: BoxDecoration(
                              color: c.isSelectedAll.value
                                   ? AppColors.primaryColor
                                  : AppColors.extraWhite,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ))),
                  ),
                  const SizedBox(width: 10),
                  Text("All", style: CustomTextStyles.f12W400()),
                ],
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                  children: [
                    Text("Delivery: ",
                        style:
                            CustomTextStyles.f12W400(color: AppColors.lGrey)),
                    Text("Rs.0",
                        style: CustomTextStyles.f12W400(
                            color: AppColors.primaryColor)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text("Total:",
                        style:
                            CustomTextStyles.f12W600(color: AppColors.lGrey)),
                    Text("Rs.0",
                        style: CustomTextStyles.f12W600(
                            color: AppColors.primaryColor)),
                  ],
                )
              ]),
              const SizedBox(width: 8),
              SizedBox(
                  height: 48,
                  width: Get.width / 3.2,
                  child: CustomElevatedButton(
                      title: "Check Out",
                      onTap: () {
                        // Get.to(() => CheckOutScreen());
                      })),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCartWidget extends StatelessWidget {
  const MyCartWidget({
    super.key,
    required this.c,
  });

  final MyCartScreenController c;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: c.toggleSelection,
            child: Obx(() => Container(
                height: 18,
                width: 18,
                decoration: BoxDecoration(
                  color: AppColors.extraWhite,
                  border: Border.all(
                      width: 1,
                      color: c.isSelected.value
                          ? AppColors.primaryColor
                          : AppColors.lGrey),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                      color: c.isSelected.value
                          ? AppColors.primaryColor
                          : AppColors.extraWhite,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ))),
          ),
          const SizedBox(width: 2),
          Image.asset(ImagePath.product, height: 70, width: 72),
          const SizedBox(width: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 217,
                height: 20,
                child: Text(
                  "Whiskas 1+ Lamb Dry Cat Food",
                  style: CustomTextStyles.f12W600(),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                "Brand: Whiskas",
                style: CustomTextStyles.f11W400(
                    color: AppColors.secondaryTextColor),
              ),
              Row(
                children: [
                  Text("Rs.4700",
                      style: CustomTextStyles.f12W600(
                          color: AppColors.primaryColor)),
                  const SizedBox(width: 110),
                  InkWell(
                    onTap: c.decrement,
                    child: Text('-',
                        style: CustomTextStyles.f12W600(
                            color: AppColors.textColor)),
                  ),
                  const SizedBox(width: 16),
                  Obx(() => Text(
                        '${c.quantity}',
                        style: CustomTextStyles.f12W400(),
                      )),
                  const SizedBox(width: 16),
                  InkWell(
                    onTap: c.increment,
                    child: Text('+',
                        style: CustomTextStyles.f12W600(
                            color: AppColors.textColor)),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
