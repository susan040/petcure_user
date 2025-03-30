import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:petcure_user/controller/splash_screen_controller.dart';
import 'package:petcure_user/utils/colors.dart';
import 'package:petcure_user/utils/image_path.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splash-screen';
  SplashScreen({super.key});
  final c = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(ImagePath.logo),
              const SizedBox(height: 60),
              const CircularProgressIndicator(
                color: Color.fromARGB(255, 245, 78, 75),
                backgroundColor: AppColors.primaryColor,
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
