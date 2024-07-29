import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petcure_user/utils/colors.dart';
import 'package:petcure_user/utils/custom_text_style.dart';
import 'package:petcure_user/utils/image_path.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile-screen";

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: false,
        backgroundColor: AppColors.extraWhite,
        title: Text("My Profile",
            style: CustomTextStyles.f16W600(color: AppColors.textColor)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset(ImagePath.shopping),
          ),
        ],
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}
