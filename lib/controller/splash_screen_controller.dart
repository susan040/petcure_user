import 'dart:async';
import 'package:get/get.dart';
import 'package:petcure_user/views/auth/login_screen.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Timer(const Duration(seconds: 3), () async {
      Get.offAll(LoginScreen());
    });
    super.onInit();
  }
}
