import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcure_user/controller/splash_screen_controller.dart';
import 'package:petcure_user/utils/image_path.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splash-screen';
  SplashScreen({super.key});
  final c = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: Get.width / 1.3,
              child: Image.asset(ImagePath.logo),
            ),
          ),
          const Center(
            child: CircularProgressIndicator(
              color: Color(0xFFF6E5FF),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }
}
