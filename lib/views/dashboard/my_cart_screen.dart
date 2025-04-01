import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcure_user/controller/dashboard/cart_screen_controller.dart';
import 'package:petcure_user/models/cart_items.dart';

class MyCartScreen extends StatelessWidget {
  final cartController = Get.put(MyCartScreenController());

  MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: Obx(() {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartController.allCartItems.length,
                itemBuilder: (context, index) {
                  CartItems item = cartController.allCartItems[index];
                  return ListTile(
                    leading: GestureDetector(
                      onTap: () {
                        cartController.toggleSelect(item);
                      },
                      child: CircleAvatar(
                        backgroundColor: item.isSelected ?? false
                            ? Colors.blue
                            : Colors.grey,
                        child: Icon(
                          item.isSelected ?? false
                              ? Icons.check
                              : Icons.check_box_outline_blank,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    title: Text(item.productName ?? ''),
                    subtitle: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            cartController
                                .decreaseQuantity(item.productId.toString());
                          },
                        ),
                        // Wrap quantity in Obx to make it reactive
                        Text(item.quantity ?? '1'),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            cartController
                                .increaseQuantity(item.productId.toString());
                          },
                        ),
                      ],
                    ),
                    trailing: Text("\$${item.price}"),
                  );
                },
              ),
            ),
            BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: GestureDetector(
                    onTap: cartController.toggleSelectAll,
                    child: Icon(
                      cartController.isAllSelected.value
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                    ),
                  ),
                  label: 'Select All',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.delivery_dining),
                  label: 'Delivery Charge: \$${cartController.deliveryCharge}',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_checkout),
                  label: 'Checkout: \$${cartController.totalAmount}',
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:petcure_user/controller/dashboard/cart_screen_controller.dart';
// import 'package:petcure_user/models/cart_items.dart';
// import 'package:petcure_user/utils/colors.dart';
// import 'package:petcure_user/utils/custom_text_style.dart';
// import 'package:petcure_user/widgets/custom/elevated_button.dart';

// class MyCartScreen extends StatelessWidget {
//   static String routeName = "/my-cart-screen";
//   final c = Get.put(MyCartScreenController());
//   MyCartScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.extraWhite,
//       appBar: AppBar(
//           elevation: 2,
//           centerTitle: false,
//           backgroundColor: AppColors.extraWhite,
//           title: Text("My Cart",
//               style: CustomTextStyles.f14W600(color: AppColors.textColor)),
//           actions: [
//             InkWell(
//               child: Padding(
//                 padding: const EdgeInsets.only(right: 18, top: 18),
//                 child: Text("Delete",
//                     style: CustomTextStyles.f14W400(
//                         color: AppColors.primaryColor)),
//               ),
//             )
//           ]),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 12),
//         child: RefreshIndicator(
//           onRefresh: () async {
//             c.allCartItems.clear();
//             c.getAllCartItems();
//           },
//           child: Obx(() => (c.loading.value)
//               ? const Center(child: CircularProgressIndicator())
//               : c.allCartItems.isEmpty
//                   ? Center(
//                       child: Text(
//                         "No products",
//                         style: CustomTextStyles.f12W400(
//                             color: AppColors.textGreyColor),
//                       ),
//                     )
//                   : ListView.builder(
//                       itemCount: c.allCartItems.length,
//                       itemBuilder: (context, index) {
//                         final CartItems products = c.allCartItems[index];
//                         return MyCartWidget(products: products);
//                       })),
//         ),
//       ),
//       bottomNavigationBar: Container(
//         height: 80,
//         decoration:
//             const BoxDecoration(color: AppColors.extraWhite, boxShadow: [
//           BoxShadow(
//             color: AppColors.primaryColor,
//             blurRadius: 7.0,
//             offset: Offset(5, 5),
//           )
//         ]),
//         child: Padding(
//           padding:
//               const EdgeInsets.only(left: 18, right: 18, top: 12, bottom: 10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   // InkWell(
//                   //   onTap: c.toggleSelectAll,
//                   //   child: Obx(() => Container(
//                   //       height: 18,
//                   //       width: 18,
//                   //       decoration: BoxDecoration(
//                   //         color: AppColors.extraWhite,
//                   //         border: Border.all(
//                   //             width: 1,
//                   //             color: c.isSelectedAll.value
//                   //                 ? AppColors.primaryColor
//                   //                 : AppColors.lGrey),
//                   //         borderRadius: BorderRadius.circular(100),
//                   //       ),
//                   //       child: Center(
//                   //         child: Container(
//                   //           height: 12,
//                   //           width: 12,
//                   //           decoration: BoxDecoration(
//                   //             color: c.isSelectedAll.value
//                   //                 ? AppColors.primaryColor
//                   //                 : AppColors.extraWhite,
//                   //             borderRadius: BorderRadius.circular(100),
//                   //           ),
//                   //         ),
//                   //       ))),
//                   // ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         Checkbox(
//                           value: c.areAllSelected,
//                           onChanged: (value) {
//                             c.toggleSelectAll(value);
//                           },
//                         ),
//                         Text("All", style: CustomTextStyles.f12W400()),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                 ],
//               ),
//               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                 Row(
//                   children: [
//                     Text("Delivery: ",
//                         style:
//                             CustomTextStyles.f12W400(color: AppColors.lGrey)),
//                     Text("Rs.0",
//                         style: CustomTextStyles.f12W400(
//                             color: AppColors.primaryColor)),
//                   ],
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   children: [
//                     Text("Total:",
//                         style:
//                             CustomTextStyles.f12W600(color: AppColors.lGrey)),
//                     Text("Rs.0",
//                         style: CustomTextStyles.f12W600(
//                             color: AppColors.primaryColor)),
//                   ],
//                 )
//               ]),
//               const SizedBox(width: 8),
//               SizedBox(
//                   height: 48,
//                   width: Get.width / 3.2,
//                   child: CustomElevatedButton(
//                       title: "Check Out",
//                       onTap: () {
//                         // Get.to(() => CheckOutScreen());
//                       })),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyCartWidget extends GetView<MyCartScreenController> {
//   MyCartWidget({
//     super.key,
//     required this.products,
//   });

//   final CartItems products;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 18, right: 18, top: 12, bottom: 8),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           InkWell(
//             onTap: () {
//               controller.toggleSelection(products); // Access via controller
//             },
//             child: Container(
//                 height: 18,
//                 width: 18,
//                 decoration: BoxDecoration(
//                   color: AppColors.extraWhite,
//                   border: Border.all(
//                       width: 1,
//                       color: products.isSelected ?? false
//                           ? AppColors.primaryColor
//                           : AppColors.lGrey),
//                   borderRadius: BorderRadius.circular(100),
//                 ),
//                 child: Center(
//                   child: Container(
//                     height: 12,
//                     width: 12,
//                     decoration: BoxDecoration(
//                       color: products.isSelected ?? false
//                           ? AppColors.primaryColor
//                           : AppColors.extraWhite,
//                       borderRadius: BorderRadius.circular(100),
//                     ),
//                   ),
//                 )),
//           ),
//           const SizedBox(width: 12),
//           ClipRRect(
//             child: CachedNetworkImage(
//               placeholder: (context, url) =>
//                   const Center(child: CircularProgressIndicator()),
//               fit: BoxFit.fill,
//               height: 65,
//               width: 65,
//               imageUrl: products.image ?? "",
//               errorWidget: (context, url, error) => Image.asset(
//                 "assets/images/blank_profile.jpg",
//                 height: 65,
//                 width: 65,
//                 fit: BoxFit.fill,
//               ),
//             ),
//           ),
//           const SizedBox(width: 14),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 width: 210,
//                 height: 20,
//                 child: Text(
//                   "${products.productName}",
//                   style: CustomTextStyles.f12W600(),
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//               Text(
//                 "Category: ${products.categoryName}",
//                 style: CustomTextStyles.f11W400(
//                     color: AppColors.secondaryTextColor),
//               ),
//               const SizedBox(height: 5),
//               Row(
//                 children: [
//                   Text("Rs.${products.price}",
//                       style: CustomTextStyles.f12W600(
//                           color: AppColors.primaryColor)),
//                   const SizedBox(width: 85),
//                   InkWell(
//                     onTap: () {
//                       int currentQuantity =
//                           int.tryParse(products.quantity ?? "0") ?? 0;
//                       if (currentQuantity > 1) {
//                         controller.updateQuantity(
//                             products, (currentQuantity - 1).toString());
//                       }
//                     },
//                     child: Text('-',
//                         style: CustomTextStyles.f12W600(
//                             color: AppColors.textColor)),
//                   ),
//                   const SizedBox(width: 16),
//                   Text(products.quantity ?? "0"),
//                   const SizedBox(width: 16),
//                   InkWell(
//                     onTap: () {
//                       int currentQuantity =
//                           int.tryParse(products.quantity ?? "0") ?? 0;
//                       controller.updateQuantity(
//                           products, (currentQuantity + 1).toString());
//                     },
//                     child: Text('+',
//                         style: CustomTextStyles.f12W600(
//                             color: AppColors.textColor)),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
