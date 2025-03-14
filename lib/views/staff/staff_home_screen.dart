import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcure_user/controller/core_controller.dart';
import 'package:petcure_user/controller/dashboard/order_screen_controller.dart';
import 'package:petcure_user/utils/custom_text_style.dart';
import 'package:petcure_user/utils/image_path.dart';
import 'package:petcure_user/views/staff/order_details_screen.dart';

class StaffHomeScreen extends StatelessWidget {
  final controller = Get.put(OrderScreenController());
  final coreController = Get.put(CoreController());

  StaffHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Good Morning message
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Good Morning 👋",
                              style: CustomTextStyles.f18W600(),
                            ),
                            Text(
                              "${coreController.currentUser.value?.name} (${coreController.currentUser.value?.userType})",
                              style: CustomTextStyles.f14W400(),
                            ),
                          ]),
                      Container(
                        width: 50,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: const DecorationImage(
                                image: AssetImage(ImagePath.blankProfile),
                                fit: BoxFit.cover)),
                      )
                    ]),
              ),

              // Obx for dynamic content
              Obx(() {
                if (controller.loading.value) {
                  return Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                if (controller.allOrderDetails.isEmpty) {
                  return Expanded(
                    child: Center(child: Text('No orders available.')),
                  );
                }
                return ListView.builder(
                  itemCount: controller.allOrderDetails.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final order = controller.allOrderDetails[index];

                    return GestureDetector(
                      onTap: () {
                        // Navigate to OrderDetailsScreen and pass the order
                        Get.to(() => OrderDetailsScreen(order: order));
                      },
                      child: Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Order ID and Status
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Order ID: ${order.orderId}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    order.orderStatus ?? 'Pending',
                                    style: TextStyle(color: Colors.green),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),

                              // Payment Method
                              Text(
                                'Payment Method: ${order.paymentMethod ?? 'N/A'}',
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(height: 5),

                              // Items List
                              Text(
                                'Items: ${order.items?.map((item) => item.productName).join(', ') ?? 'No items'}',
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(height: 5),

                              // Total Price
                              Text(
                                'Total Price: \$${order.orderTotalPrice ?? '0'}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
