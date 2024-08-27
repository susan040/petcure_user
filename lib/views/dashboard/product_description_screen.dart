import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:petcure_user/controller/dashboard/product_desc_controller.dart';
import 'package:petcure_user/utils/colors.dart';
import 'package:petcure_user/utils/custom_snackbar.dart';
import 'package:petcure_user/utils/custom_text_style.dart';
import 'package:petcure_user/utils/image_path.dart';
import 'package:petcure_user/widgets/custom/elevated_button.dart';
import 'package:petcure_user/widgets/description_screen_widget.dart';

class ProductDescriptionScreen extends StatelessWidget {
  static String routeName = "/product-description-screen";
  final ProductDescController controller = Get.put(ProductDescController());

  ProductDescriptionScreen({super.key});

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
        title: Text("Description",
            style: CustomTextStyles.f16W600(color: AppColors.textColor)),
      ),
      body: SingleChildScrollView(
        child: Column(
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
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Whiskas 1+ Lamb Dry Cat Food",
                      style: CustomTextStyles.f18W600()),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Rs.4700", style: CustomTextStyles.f16W600()),
                      Row(
                        children: [
                          Text("12 Sold", style: CustomTextStyles.f14W400()),
                          const SizedBox(width: 5),
                          SvgPicture.asset(ImagePath.sharing,
                              height: 14, width: 16)
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(ImagePath.star),
                      const SizedBox(width: 4),
                      Text(
                        "4.3/5 | 48 reviews",
                        style: CustomTextStyles.f14W400(),
                      )
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Brand: Whiskas", style: CustomTextStyles.f14W400()),
                      Row(
                        children: [
                          Text("Quantity:", style: CustomTextStyles.f14W400()),
                          const SizedBox(width: 6),
                          Container(
                            height: 23,
                            width: 65,
                            decoration: BoxDecoration(
                                color: AppColors.secondaryColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                "14 Left",
                                style: CustomTextStyles.f14W400(),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text("Description", style: CustomTextStyles.f16W600()),
                  const SizedBox(height: 4),
                  Text(
                    "Whiskas 1+ Lamb is a balanced dry food for adult cats (12+ months). Its crunchy kibble, with a delicious filling, supports dental health through mechanical abrasion. The tailored mineral content promotes urinary tract health, while zinc ensures healthy skin and a shiny coat. Vitamin A supports vision. This fibre-rich recipe aids digestion and is free from artificial colors and flavors. Made with high-quality ingredients, it is produced in eco-friendly factories using renewable energy and recyclable packaging.",
                    style: CustomTextStyles.f14W400(),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 20),
                  const Divider(
                    thickness: 0.5,
                    color: AppColors.lGrey,
                  ),
                  const SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SvgPicture.asset(ImagePath.returnAllow),
                            const SizedBox(height: 6),
                            Text("No Returns Allowed",
                                style: CustomTextStyles.f10W400()),
                          ],
                        ),
                        Column(
                          children: [
                            SvgPicture.asset(ImagePath.noCash),
                            const SizedBox(height: 6),
                            Text("No Cash on Delivery",
                                style: CustomTextStyles.f10W400()),
                          ],
                        ),
                        Column(
                          children: [
                            SvgPicture.asset(ImagePath.warranty),
                            const SizedBox(height: 6),
                            Text("Warranty not available",
                                style: CustomTextStyles.f10W400()),
                          ],
                        ),
                      ]),
                  const SizedBox(height: 10),
                  const Divider(
                    thickness: 0.5,
                    color: AppColors.lGrey,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 42,
                            width: 42,
                            decoration: BoxDecoration(
                              color: AppColors.secondaryColor,
                              borderRadius: BorderRadius.circular(50),
                              image: const DecorationImage(
                                  image: AssetImage(ImagePath.store),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Text(
                            "Show Wholly Network",
                            style: CustomTextStyles.f14W400(),
                          )
                        ],
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Center(
                            child: Icon(
                          Icons.mail_outline,
                          color: AppColors.extraWhite,
                          size: 18,
                        )),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text("Reviews & Ratings", style: CustomTextStyles.f16W600()),
                  const SizedBox(height: 10),
                  ReviewsWidget(controller: controller),
                  const SizedBox(height: 16),
                  Text("Similar Product", style: CustomTextStyles.f16W600()),
                  const SizedBox(height: 10),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SimilarProduct(),
                        SizedBox(width: 18),
                        SimilarProduct(),
                        SizedBox(width: 18),
                        SimilarProduct(),
                        SizedBox(width: 18),
                      ],
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 30)
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 79,
        decoration:
            const BoxDecoration(color: AppColors.extraWhite, boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor,
            blurRadius: 7.0,
            offset: Offset(5, 5),
          ),
        ]),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 18, right: 18, top: 15, bottom: 15),
          child: Row(
            children: [
              Container(
                  height: 55,
                  width: Get.width / 2.35,
                  decoration: BoxDecoration(
                      color: AppColors.extraWhite,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 0.5, color: AppColors.primaryColor)),
                  child: Center(
                      child: Text("Buy",
                          style: CustomTextStyles.f14W600(
                              color: AppColors.primaryColor)))),
              const SizedBox(width: 20),
              SizedBox(
                  width: Get.width / 2.35,
                  height: 55,
                  child: CustomElevatedButton(
                      title: "Add To Cart",
                      onTap: () {
                        CustomSnackBar.success(
                            title: "Produce Added",
                            message: "Add to cart successful");
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
