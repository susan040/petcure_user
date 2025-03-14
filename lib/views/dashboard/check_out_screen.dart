import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:petcure_user/controller/dashboard/check_out_screen_controller.dart';
import 'package:petcure_user/utils/colors.dart';
import 'package:petcure_user/utils/custom_text_style.dart';
import 'package:petcure_user/utils/image_path.dart';
import 'package:petcure_user/views/dashboard/payment_option_screen.dart';
import 'package:petcure_user/widgets/custom/elevated_button.dart';

class CheckOutScreen extends StatelessWidget {
  static String routeName = "/check-out-screen";
  final c = Get.put(CheckOutScreenController());
  CheckOutScreen({
    super.key,
    required this.shippingAddress,
    required this.quantity,
    required this.price,
    required this.productId,
  });
  final String shippingAddress;
  final String quantity;
  final String price;
  final String productId;
  @override
  Widget build(BuildContext context) {
    final double totalAmount =
        (double.parse(price) * int.parse(quantity)) + 120;
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
        title: Text("Checkout",
            style: CustomTextStyles.f16W600(color: AppColors.textColor)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 14, right: 14, top: 10),
              height: 114,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.extraWhite,
                  borderRadius: BorderRadius.circular(3),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.lightGrey,
                      blurRadius: 4.0,
                      offset: const Offset(1, 1),
                    )
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(ImagePath.location),
                      const SizedBox(width: 6),
                      Text("Shipping Details",
                          style: CustomTextStyles.f14W600()),
                    ],
                  ),
                  Divider(thickness: 0.5, color: AppColors.lightGrey),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Deliver To: Susan Thapa",
                          style: CustomTextStyles.f12W600()),
                      Text("Change",
                          style: CustomTextStyles.f12W400(
                              color: AppColors.primaryColor))
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(shippingAddress, style: CustomTextStyles.f12W400()),
                  const SizedBox(height: 3),
                  Text("9824170016",
                      style: CustomTextStyles.f12W400(
                          color: AppColors.secondaryTextColor)),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.only(left: 14, right: 14, top: 10),
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.extraWhite,
                  borderRadius: BorderRadius.circular(3),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.lightGrey,
                      blurRadius: 4.0,
                      offset: const Offset(1, 1),
                    )
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(ImagePath.product, height: 70, width: 72),
                      const SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Whiskas 1+ Lamb Dry Cat Food",
                              style: CustomTextStyles.f12W600()),
                          const SizedBox(height: 4),
                          Text("Brand: Whiskas",
                              style: CustomTextStyles.f12W400(
                                  color: AppColors.lGrey)),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Rs.4700",
                                  style: CustomTextStyles.f14W600(
                                      color: AppColors.primaryColor)),
                              const SizedBox(width: 100),
                              Text("Qty:", style: CustomTextStyles.f14W600()),
                              const SizedBox(width: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // InkWell(
                                  //   onTap: c.decrement,
                                  //   child: Text('-',
                                  //       style: CustomTextStyles.f14W400(
                                  //           color: AppColors.textColor)),
                                  // ),
                                  const SizedBox(width: 8),
                                  // Obx(() => Text(
                                  //       '${c.count}',
                                  //       style: CustomTextStyles.f12W400(),
                                  //     )),
                                  Text(
                                    quantity,
                                    style: CustomTextStyles.f12W400(),
                                  )
                                  // const SizedBox(width: 8),
                                  // InkWell(
                                  //   onTap: c.increment,
                                  //   child: Text('+',
                                  //       style: CustomTextStyles.f14W400(
                                  //           color: AppColors.textColor)),
                                  // )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Divider(thickness: 0.5, color: AppColors.lightGrey),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("1 items(s).Subtotal:",
                          style: CustomTextStyles.f12W400()),
                      Text(price,
                          style: CustomTextStyles.f12W400(
                              color: AppColors.primaryColor)),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.only(
                  left: 14, right: 14, top: 14, bottom: 14),
              height: 135,
              width: double.infinity,
              decoration:
                  BoxDecoration(color: AppColors.extraWhite, boxShadow: [
                BoxShadow(
                  color: AppColors.lightGrey,
                  blurRadius: 4.0,
                  offset: const Offset(1, 1),
                )
              ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Order Summary", style: CustomTextStyles.f14W600()),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Items Total", style: CustomTextStyles.f14W400()),
                      Text("Rs.$price", style: CustomTextStyles.f14W400())
                    ],
                  ),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Delivery Fee", style: CustomTextStyles.f14W400()),
                      Text("Rs.120", style: CustomTextStyles.f14W400())
                    ],
                  ),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Payment", style: CustomTextStyles.f14W400()),
                      Text("Rs.$totalAmount", style: CustomTextStyles.f14W400())
                    ],
                  )
                ],
              ),
            )
          ],
        ),
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
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                  children: [
                    Text("Total:",
                        style:
                            CustomTextStyles.f14W600(color: AppColors.lGrey)),
                    Text("Rs.$totalAmount",
                        style: CustomTextStyles.f16W600(
                            color: AppColors.primaryColor)),
                  ],
                ),
                Text("All taxes included",
                    style: CustomTextStyles.f14W400(color: AppColors.lGrey)),
              ]),
              const SizedBox(width: 13),
              SizedBox(
                  height: 55,
                  width: Get.width / 3,
                  child: CustomElevatedButton(
                      title: "Place Order",
                      onTap: () {
                        Get.to(() => PaymentOptionScreen(
                              shippingAddress: shippingAddress,
                              quantity: quantity,
                              price: price,
                              productId: productId,
                            ));
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
