import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcure_user/controller/dashboard/shop_screen_controller.dart';
import 'package:petcure_user/models/category.dart';
import 'package:petcure_user/models/products.dart';
import 'package:petcure_user/utils/colors.dart';
import 'package:petcure_user/utils/custom_text_style.dart';
import 'package:petcure_user/utils/image_path.dart';
import 'package:petcure_user/views/dashboard/product_description_screen.dart';

class ShopScreen extends StatelessWidget {
  static String routeName = "/shop-screen";
  final c = Get.put(ShopScreenController());
  ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Choose Category", style: CustomTextStyles.f16W600()),
                const SizedBox(height: 10),
                Obx(
                  () => (c.loading.value)
                      ? const Center(child: CircularProgressIndicator())
                      : c.allCategories.isEmpty
                          ? Center(
                              child: Text(
                                "No categories",
                                style: CustomTextStyles.f12W400(
                                    color: AppColors.textGreyColor),
                              ),
                            )
                          : SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  // Adding the "All" category
                                  CategoryWidget(
                                    categories: Categories(name: 'All'),
                                  ),
                                  // Other categories
                                  ...c.allCategories.map((categories) {
                                    return CategoryWidget(
                                        categories: categories);
                                  }),
                                ],
                              ),
                            ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => (c.loading.value)
                      ? const Center(child: CircularProgressIndicator())
                      : c.allProducts.isEmpty
                          ? Center(
                              child: Text(
                              "No Products",
                              style: CustomTextStyles.f12W400(
                                  color: AppColors.textGreyColor),
                            ))
                          : GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 14,
                                mainAxisSpacing: 14,
                                childAspectRatio: 0.68,
                              ),
                              itemCount: c.allProducts.length,
                              itemBuilder: (context, index) {
                                final Products products = c.allProducts[index];
                                return ProductWidget(products: products);
                              },
                            ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.products,
  });
  final Products products;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ProductDescriptionScreen(
              products: products,
            ));
      },
      child: Container(
        height: 208,
        width: 153,
        decoration: BoxDecoration(
          color: AppColors.extraWhite,
          boxShadow: [
            BoxShadow(
              color: AppColors.lightGrey,
              offset: const Offset(1, 1),
              blurRadius: 4,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  fit: BoxFit.cover,
                  height: 90,
                  width: 118,
                  imageUrl: products.productImage ?? "",
                  errorWidget: (context, url, error) => Image.asset(
                    "assets/images/blank_profile.jpg",
                    height: 90,
                    width: 118,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 12, right: 12, top: 10, bottom: 5),
              child: Text(
                "${products.productName}",
                style: CustomTextStyles.f12W600(),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 4),
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 16,
                  ),
                  Text(
                    "4.3/5 (48)| 12 Sold",
                    style: CustomTextStyles.f12W400(color: AppColors.lGrey),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 2),
              child: Text(
                "${products.categoryName}",
                style: CustomTextStyles.f12W400(),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Text(
                "${products.productPrice}",
                style: CustomTextStyles.f12W600(color: AppColors.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  CategoryWidget({
    super.key,
    required this.categories,
  });

  final c = Get.put(ShopScreenController());
  final Categories categories;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => c.toggleSelection(categories.name ?? ""),
      child: Obx(
        () => Container(
          margin: const EdgeInsets.only(left: 3, right: 3),
          height: 35,
          width: categories.name == 'All' ? 60 : 115,
          decoration: BoxDecoration(
            color: AppColors.extraWhite,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1,
              color: c.selectedCategory.value == categories.name
                  ? AppColors.primaryColor
                  : AppColors.lightGrey,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (categories.name == 'All')
                Text(
                  'All',
                  style: CustomTextStyles.f12W400(),
                )
              else
                ClipRRect(
                  child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    fit: BoxFit.cover,
                    imageUrl: categories.image ?? "",
                    errorWidget: (context, url, error) => Image.asset(
                      ImagePath.blankImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              // Always show the category name, centered
              if (categories.name != 'All')
                Text(
                  categories.name ?? "",
                  style: CustomTextStyles.f12W400(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
