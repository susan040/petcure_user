import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:petcure_user/controller/dash_screen_controller.dart';
import 'package:petcure_user/utils/colors.dart';
import 'package:petcure_user/utils/image_path.dart';

class DashScreen extends StatelessWidget {
  static String routeName = "/dash-screen";
  final c = Get.put(DashScreenController());
  DashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => c.pages[c.currentIndex.value]),
        bottomNavigationBar: Obx(() => Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  color: AppColors.unselectedGrey,
                  blurRadius: 10.0,
                  offset: Offset(4, 4),
                )
              ]),
              child: BottomNavigationBar(
                elevation: 3,
                backgroundColor: AppColors.extraWhite,
                selectedItemColor: AppColors.primaryColor,
                unselectedIconTheme: const IconThemeData(color: Colors.white),
                unselectedItemColor: AppColors.unselectedGrey,
                type: BottomNavigationBarType.fixed,
                currentIndex: c.currentIndex.value,
                onTap: c.onItemTapped,
                iconSize: 26,
                items: [
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(
                        top: 9,
                      ),
                      child: SvgPicture.asset(
                        ImagePath.home,
                        color: c.currentIndex.value == 0
                            ? AppColors.primaryColor
                            : AppColors.unselectedGrey,
                        height: 20,
                      ),
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(
                        top: 9,
                      ),
                      child: SvgPicture.asset(
                        ImagePath.shop,
                        color: c.currentIndex.value == 1
                            ? AppColors.primaryColor
                            : AppColors.unselectedGrey,
                        height: 20,
                      ),
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(
                        top: 9,
                      ),
                      child: SvgPicture.asset(
                        ImagePath.person,
                        color: c.currentIndex.value == 2
                            ? AppColors.primaryColor
                            : AppColors.unselectedGrey,
                        height: 23,
                      ),
                    ),
                    label: "",
                  ),
                ],
              ),
            )));
  }
}
