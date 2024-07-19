import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:petcure_user/controller/dashboard/home_screen_controller.dart';
import 'package:petcure_user/utils/colors.dart';
import 'package:petcure_user/utils/custom_text_style.dart';
import 'package:petcure_user/utils/image_path.dart';
import 'package:petcure_user/widgets/custom/custom_textfield.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home-screen";
  final c = Get.put(HomeScreenController());
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    "Good Morning 👋",
                    style: CustomTextStyles.f18W600(),
                  ),
                  Text(
                    "Emily Johnson",
                    style: CustomTextStyles.f14W400(),
                  ),
                ]),
                Container(
                  width: 50,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                          image: NetworkImage(
                              "https://img.freepik.com/free-photo/close-up-brunette-young-woman_1139-15.jpg"),
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
              Container(
                height: 75,
                width: 72,
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: SvgPicture.asset(ImagePath.dog),
              )
            ],
          ),
        ),
      ),
    );
  }
}
