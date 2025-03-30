import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:petcure_user/controller/core_controller.dart';
import 'package:petcure_user/controller/dashboard/home_screen_controller.dart';
import 'package:petcure_user/utils/colors.dart';
import 'package:petcure_user/utils/custom_text_style.dart';
import 'package:petcure_user/utils/image_path.dart';
import 'package:petcure_user/views/dashboard/doctor_description_screen.dart';
import 'package:petcure_user/views/staff/staff_home_screen.dart';
import 'package:petcure_user/widgets/custom/custom_textfield.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home-screen";
  final c = Get.put(HomeScreenController());
  final coreController = Get.put(CoreController());
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (coreController.userType.value == "staff") {
        return StaffHomeScreen();
      } else {
        return Scaffold(
          backgroundColor: AppColors.extraWhite,
          body: SafeArea(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 18, right: 18, top: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Good Morning 👋",
                                          style: CustomTextStyles.f18W600(),
                                        ),
                                        Obx(() {
                                          if (coreController.userType.value ==
                                              "staff") {
                                            return Text(
                                              "${coreController.currentUser.value?.name} (${coreController.currentUser.value?.userType})",
                                              style: CustomTextStyles.f14W400(),
                                            );
                                          } else {
                                            return Text(
                                              "${coreController.currentUser.value?.name} (${coreController.currentUser.value?.userType})",
                                              style: CustomTextStyles.f14W400(),
                                            );
                                          }
                                        })
                                      ]),
                                  Container(
                                    width: 50,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                ImagePath.blankProfile),
                                            fit: BoxFit.cover)),
                                  )
                                ]),
                            const SizedBox(height: 20),
                            CustomTextField(
                              controller: c.searchController,
                              hint: "Search..",
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.text,
                              preIconPath: Icons.search,
                              preIconSize: 22,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Categories",
                              style: CustomTextStyles.f14W600(),
                            ),
                            const SizedBox(height: 8),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CategoryWidget(
                                    image: ImagePath.cat, name: "Cat"),
                                CategoryWidget(
                                    image: ImagePath.dog, name: "Dog"),
                                CategoryWidget(
                                    image: ImagePath.bird, name: "Bird"),
                                CategoryWidget(
                                    image: ImagePath.rabbit, name: "Rabbit"),
                              ],
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //       left: 18, right: 18, top: 10, bottom: 10),
                            //   child: Obx(() => (c.loading.value)
                            //       ? const Center(
                            //           child: CircularProgressIndicator())
                            //       : c.allCategories.isEmpty
                            //           ? Center(
                            //               child: Text(
                            //               "No categories",
                            //               style: CustomTextStyles.f14W400(
                            //                   color: AppColors.textGreyColor),
                            //             ))
                            //           : ListView.builder(
                            //               shrinkWrap: true,
                            //               physics:
                            //                   const NeverScrollableScrollPhysics(),
                            //               itemCount: c.allCategories.length,
                            //               scrollDirection: Axis.vertical,
                            //               itemBuilder: (context, index) {
                            //                 final Categories categories =
                            //                     c.allCategories[index];
                            //                 return CategoryWidget(
                            //                     categories: categories);
                            //               },
                            //             )),
                            // ),
                            const SizedBox(height: 20),
                            Text(
                              "Doctors",
                              style: CustomTextStyles.f14W600(),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      );
                    }
                    return const DoctorWidget();
                  })),
        );
      }
    });
  }
}

class DoctorWidget extends StatelessWidget {
  const DoctorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => DescriptionScreen());
      },
      child: Container(
        margin: const EdgeInsets.only(left: 18, right: 18, bottom: 14),
        height: 119,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.extraWhite,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              spreadRadius: 3,
              blurRadius: 4,
              color: AppColors.lightGrey,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
              height: 100,
              width: 131,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg"),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Emily Johnson",
                    style: CustomTextStyles.f14W600(),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(ImagePath.star),
                      const SizedBox(width: 3),
                      SvgPicture.asset(ImagePath.star),
                      const SizedBox(width: 3),
                      SvgPicture.asset(ImagePath.star),
                      const SizedBox(width: 3),
                      SvgPicture.asset(ImagePath.star),
                      const SizedBox(width: 3),
                      SvgPicture.asset(
                        ImagePath.star,
                        color: AppColors.secondaryTextColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(ImagePath.location),
                      const SizedBox(width: 4),
                      Text(
                        "Chauthe, Pokhara",
                        style: CustomTextStyles.f12W400(color: AppColors.lGrey),
                      )
                    ],
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: 160,
                    child: Text(
                      "fdsf aehfjsd fadifj adfk do gadgdv v ffg",
                      style: CustomTextStyles.f12W400(color: AppColors.lGrey),
                      maxLines: 2,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.image,
    required this.name,
  });
  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 80,
      width: 72,
      decoration: BoxDecoration(
        color: AppColors.unselectedGrey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          const SizedBox(height: 4),
          Image.asset(
            image,
            height: 50,
            width: 50,
          ),
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(15),
          //   child: CachedNetworkImage(
          //     placeholder: (context, url) =>
          //         const Center(child: CircularProgressIndicator()),
          //     fit: BoxFit.cover,
          //     height: 50,
          //     width: 50,
          //     imageUrl: image,
          //     errorWidget: (context, url, error) => Image.asset(
          //       "assets/images/blank_profile.jpg",
          //       height: 50,
          //       width: 50,
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          Text(name, style: CustomTextStyles.f12W400())
        ],
      ),
    );
  }
}
