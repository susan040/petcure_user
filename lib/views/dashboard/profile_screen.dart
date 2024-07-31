// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:petcure_user/utils/colors.dart';
import 'package:petcure_user/utils/custom_text_style.dart';
import 'package:petcure_user/utils/image_path.dart';
import 'package:petcure_user/views/auth/login_screen.dart';
import 'package:petcure_user/views/dashboard/edit_profile_screen.dart';
import 'package:petcure_user/widgets/custom/elevated_button.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile-screen";

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Text("My Profile",
            style: CustomTextStyles.f16W600(color: AppColors.textColor)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SvgPicture.asset(ImagePath.shopping),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 18, top: 25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg"),
                              fit: BoxFit.cover)),
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
                      "Emily Johnson",
                      style: CustomTextStyles.f16W600(),
                    ),
                    Text(
                      "emilyjohnson@gmail.com",
                      style: CustomTextStyles.f14W400(),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                        height: 40,
                        width: 155,
                        child: CustomElevatedButton(
                            title: "Edit Profile",
                            onTap: () {
                              Get.to(() => EditProfileScreen());
                            }))
                  ],
                )
              ],
            ),
            SizedBox(height: 35),
            InkWell(
              onTap: () {},
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
              onTap: () {},
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
              onTap: () {},
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
              onTap: () {},
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
                Get.offAll(() => LoginScreen());
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
