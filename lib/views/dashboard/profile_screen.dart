// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:petcure_user/controller/core_controller.dart';
import 'package:petcure_user/utils/colors.dart';
import 'package:petcure_user/utils/custom_text_style.dart';
import 'package:petcure_user/utils/image_path.dart';
import 'package:petcure_user/views/dashboard/about_us_screen.dart';
import 'package:petcure_user/views/dashboard/edit_profile_screen.dart';
import 'package:petcure_user/views/dashboard/help_screen.dart';
import 'package:petcure_user/views/dashboard/history_screen.dart';
import 'package:petcure_user/views/dashboard/terms_condition_screen.dart';
import 'package:petcure_user/widgets/custom/elevated_button.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile-screen";
  final coreController = Get.put(CoreController());
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        elevation: 2,
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Text("My Profile",
            style: CustomTextStyles.f16W600(color: AppColors.textColor)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 18, top: 25),
        child: Column(
          children: [
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: CachedNetworkImage(
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                            imageUrl:
                                coreController.currentUser.value?.image ?? "",
                            errorWidget: (context, url, error) => Image.asset(
                              "assets/commons/blank_photo.jpg",
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 8,
                        child: Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                              color: AppColors.extraWhite,
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(1, 1),
                                    color: AppColors.lightGrey)
                              ]),
                          child: Center(
                            child: SvgPicture.asset(ImagePath.camera),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 18),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${coreController.currentUser.value?.name}",
                        style: CustomTextStyles.f16W600(),
                      ),
                      Text(
                        "${coreController.currentUser.value?.email}",
                        style: CustomTextStyles.f14W400(),
                      ),
                      Text(
                        "${coreController.currentUser.value?.userType}",
                        style: CustomTextStyles.f14W400(
                            color: AppColors.primaryColor),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                          height: 40,
                          width: 155,
                          child: CustomElevatedButton(
                              title: "Edit Profile",
                              onTap: () {
                                debugPrint(
                                    "Image URL: ${coreController.currentUser.value?.image}");

                                Get.to(() => EditProfileScreen());
                              }))
                    ],
                  )
                ],
              );
            }),
            SizedBox(height: 35),
            InkWell(
              onTap: () {
                Get.to(() => TermsConditionScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(ImagePath.terms),
                      SizedBox(width: 12),
                      Text('Terms and Conditions',
                          style: CustomTextStyles.f14W400()),
                    ],
                  ),
                  SvgPicture.asset(ImagePath.rightArrow)
                ],
              ),
            ),
            SizedBox(height: 15),
            InkWell(
              onTap: () {
                Get.to(() => AboutUsScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        ImagePath.aboutUs,
                        height: 18,
                        width: 18,
                      ),
                      SizedBox(width: 12),
                      Text('About Us', style: CustomTextStyles.f14W400()),
                    ],
                  ),
                  SvgPicture.asset(ImagePath.rightArrow)
                ],
              ),
            ),
            SizedBox(height: 15),
            Divider(thickness: 0.5, color: AppColors.lGrey),
            SizedBox(height: 15),
            InkWell(
              onTap: () {
                Get.to(() => HelpScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(ImagePath.help, height: 18, width: 18),
                      SizedBox(width: 12),
                      Text('Help', style: CustomTextStyles.f14W400()),
                    ],
                  ),
                  SvgPicture.asset(ImagePath.rightArrow)
                ],
              ),
            ),
            SizedBox(height: 18),
            InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        ImagePath.rating,
                        height: 18,
                        width: 18,
                      ),
                      SizedBox(width: 12),
                      Text('Rate App', style: CustomTextStyles.f14W400()),
                    ],
                  ),
                  SvgPicture.asset(ImagePath.rightArrow)
                ],
              ),
            ),
            SizedBox(height: 18),
            InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(ImagePath.share, height: 22, width: 22),
                      SizedBox(width: 12),
                      Text('Share this app', style: CustomTextStyles.f14W400()),
                    ],
                  ),
                  SvgPicture.asset(ImagePath.rightArrow)
                ],
              ),
            ),
            SizedBox(height: 18),
            InkWell(
              onTap: () {
                Get.to(() => HistoryScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(ImagePath.history,
                          height: 22, width: 22),
                      SizedBox(width: 12),
                      Text('History', style: CustomTextStyles.f14W400()),
                    ],
                  ),
                  SvgPicture.asset(ImagePath.rightArrow)
                ],
              ),
            ),
            SizedBox(height: 15),
            Divider(thickness: 0.5, color: AppColors.lGrey),
            SizedBox(height: 15),
            InkWell(
              onTap: () {
                coreController.logOut();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(ImagePath.logOut, height: 17, width: 17),
                      SizedBox(width: 12),
                      Text(
                        'Log Out',
                        style: CustomTextStyles.f14W400(),
                      ),
                    ],
                  ),
                  SvgPicture.asset(ImagePath.rightArrow)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
