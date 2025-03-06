import 'dart:async';
import 'package:get/get.dart';
import 'package:petcure_user/controller/core_controller.dart';
import 'package:petcure_user/views/auth/login_screen.dart';
import 'package:petcure_user/views/dash_screen.dart';

class SplashScreenController extends GetxController {
  final c = Get.put(CoreController());
  @override
  void onInit() {
    Timer(const Duration(seconds: 3), () async {
      if (c.isUserLoggendIn()) {
        Get.offAll(() => DashScreen());
      } else {
        Get.offAll(() => LoginScreen());
      }
    });
    super.onInit();
  }
}
