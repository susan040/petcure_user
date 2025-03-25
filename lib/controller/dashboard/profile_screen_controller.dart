// profile_screen_controller.dart
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petcure_user/controller/core_controller.dart';
import 'package:petcure_user/models/users.dart';
import 'package:petcure_user/repo/edit_profile_repo.dart';
import 'package:petcure_user/utils/custom_snackbar.dart';
import 'package:petcure_user/utils/storage_keys.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class ProfileScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final coreController = Get.find<CoreController>();

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final genderController = TextEditingController();
  final picker = ImagePicker();

  Rxn<File> image = Rxn<File>();
  Rxn<String> avatarUrl = Rxn<String>();

  @override
  void onInit() {
    super.onInit();
    userDetails();
  }

  void userDetails() {
    var user = Get.find<CoreController>().currentUser.value;
    if (user != null) {
      nameController.text = user.name ?? "";
      addressController.text = user.address ?? "";
      phoneController.text = user.phoneNumber ?? "";
      genderController.text = user.gender ?? "";
      avatarUrl.value = user.image ?? "";
    }
  }

  void pickImage() async {
    log("Picking image");
    final pickedImage = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
        maxHeight: 250,
        maxWidth: 250);

    if (pickedImage != null) {
      log("Image picked: ${pickedImage.path}");
      image.value = File(pickedImage.path);
    } else {
      log("No image selected");
    }
  }

  final loading = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);
  void submit() async {
    if (formKey.currentState!.validate()) {
      loading.show(message: "Please wait..");
      await EditProfileRepo.editProfile(
        image: image.value,
        name: nameController.text,
        address: addressController.text,
        phoneNumber: phoneController.text,
        gender: genderController.text,
        onSuccess: (user) async {
          loading.hide();
          final box = GetStorage();
          user.token ??= coreController.currentUser.value?.token;
          await box.write(StorageKeys.USER, json.encode(user.toJson()));
          coreController.currentUser.value = Users.fromJson(user.toJson());
          avatarUrl.value = user.image;
          userDetails();
          Get.find<CoreController>().loadCurrentUser();

          Get.back();
          CustomSnackBar.success(
              title: "Update Profile", message: "Profile update Successful");
        },
        onError: (message) {
          loading.hide();
          CustomSnackBar.error(title: "Profile", message: message);
        },
      );
    }
  }
}
