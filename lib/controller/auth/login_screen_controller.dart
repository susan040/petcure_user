import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:petcure_user/controller/core_controller.dart';
import 'package:petcure_user/repo/login_repo.dart';
import 'package:petcure_user/utils/custom_snackbar.dart';
import 'package:petcure_user/utils/storage_keys.dart';
import 'package:petcure_user/views/dash_screen.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class LoginScreenController extends GetxController {
  final key = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool passwordObscure = true.obs;

  void onEyeCLick() {
    passwordObscure.value = !passwordObscure.value;
  }

  final loading = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);
  void onSubmit() async {
    if (key.currentState!.validate()) {
      loading.show(message: "Please wait..");

      await LoginRepo.login(
        email: emailController.text,
        password: passwordController.text,
        onSuccess: (user, token, userType) async {
          loading.hide();
          final box = GetStorage();
          await box.write(StorageKeys.USER, json.encode(user.toJson()));
          await box.write(StorageKeys.ACCESS_TOKEN, token.toString());
          await box.write(StorageKeys.USER_TYPE, userType);
          Get.find<CoreController>().loadCurrentUser();
          Get.offAll(() => DashScreen());

          CustomSnackBar.success(title: "Login", message: "Login Successful");
        },
        onError: (message) {
          loading.hide();
          CustomSnackBar.error(title: "Login", message: message);
        },
      );
    }
  }
}
