import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:petcure_user/controller/dashboard/product_desc_controller.dart';
import 'package:petcure_user/controller/dashboard/shop_screen_controller.dart';
import 'package:petcure_user/models/products.dart';
import 'package:petcure_user/utils/colors.dart';
import 'package:petcure_user/utils/custom_snackbar.dart';
import 'package:petcure_user/utils/custom_text_style.dart';
import 'package:petcure_user/utils/image_path.dart';
import 'package:petcure_user/views/dashboard/check_out_screen.dart';
import 'package:petcure_user/widgets/custom/elevated_button.dart';
import 'package:petcure_user/widgets/description_screen_widget.dart';

class ProductDescriptionScreen extends StatelessWidget {
  static String routeName = "/product-description-screen";
  final ProductDescController controller = Get.put(ProductDescController());
  final c = Get.put(ShopScreenController());
  ProductDescriptionScreen({super.key, required this.products});
  final Products products;
  @override
  Widget build(BuildContext context) {
    int remainingQuantity = c.getRemainingQuantity(products);
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
            // SizedBox(
            //   height: 300,
            //   child: PageView.builder(
            //     onPageChanged: (index) {
            //       controller.updatePageIndex(index);
            //     },
            //     itemCount: controller.images.length,
            //     itemBuilder: (context, index) {
            //       return Center(
            //         child: Image.asset(
            //           controller.images[index], // Load images from controller
            //           width: 200, // Adjust width as needed
            //           height: 270,
            //           fit: BoxFit.fill,
            //         ),
            //       );
            //     },
            //   ),
            // ),
            ClipRRect(
              child: CachedNetworkImage(
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                fit: BoxFit.cover,
                height: 270,
                width: 250,
                imageUrl: products.productImage ?? "",
                errorWidget: (context, url, error) => Image.asset(
                  "assets/images/blank_profile.jpg",
                  height: 270,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),

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
                  Text("${products.productName}",
                      style: CustomTextStyles.f18W600()),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Rs.${products.productPrice}",
                          style: CustomTextStyles.f16W600()),
                      Row(
                        children: [
                          Text("${products.totalSold ?? 0} Sold",
                              style: CustomTextStyles.f14W400()),
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
                        "${products.averageRating ?? 0}/5 | ${products.totalReviews ?? 0} reviews",
                        style: CustomTextStyles.f14W400(),
                      )
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Category: ${products.categoryName}",
                          style: CustomTextStyles.f14W400()),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                left: 12, right: 12, top: 4, bottom: 4),
                            decoration: BoxDecoration(
                                color: AppColors.lightGrey,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Row(
                                children: [
                                  Text(
                                    "$remainingQuantity",
                                    style: CustomTextStyles.f12W400(),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    "Left",
                                    style: CustomTextStyles.f12W400(),
                                  ),
                                ],
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
                    "${products.productDescription}",
                    style: CustomTextStyles.f12W400(),
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
                              color: AppColors.lightGrey,
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
                  // Obx(
                  //   () => (c.loading.value)
                  //       ? const Center(child: CircularProgressIndicator())
                  //       : c.allProducts.isEmpty
                  //           ? Center(
                  //               child: Text(
                  //               "No reviews",
                  //               style: CustomTextStyles.f12W400(
                  //                   color: AppColors.textGreyColor),
                  //             ))
                  //           : ListView.builder(
                  //               physics: const NeverScrollableScrollPhysics(),
                  //               shrinkWrap: true,
                  //               itemCount: c.allProducts.length,
                  //               itemBuilder: (context, index) {
                  //                 final Reviews products =
                  //                     c.allProducts[index];
                  //                 return ProductWidget(products: products);
                  //               },
                  //             ),
                  // ),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  // Get.to(() => CheckOutScreen());
                  showBuyBottomSheet();
                },
                child: Container(
                    height: 55,
                    width: Get.width / 2.36,
                    decoration: BoxDecoration(
                        color: AppColors.extraWhite,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 0.5, color: AppColors.primaryColor)),
                    child: Center(
                        child: Text("Buy",
                            style: CustomTextStyles.f14W600(
                                color: AppColors.primaryColor)))),
              ),
              SizedBox(
                  width: Get.width / 2.36,
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

  void showBuyBottomSheet() {
    final TextEditingController addressController = TextEditingController();
    final RxInt quantity = 1.obs;

    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Enter Shipping Address",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: "Shipping Address",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            Text("Select Quantity",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        if (quantity.value > 1) quantity.value--;
                      },
                    ),
                    Text(quantity.value.toString(),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        quantity.value++;
                      },
                    ),
                  ],
                )),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Get.to(() => CheckOutScreen(
                      shippingAddress: addressController.text,
                      quantity: quantity.value.toString(),
                      price: products.productPrice.toString(),
                      productId: products.productId.toString(),
                    ));
              },
              child: Text("Confirm Purchase"),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }
}
