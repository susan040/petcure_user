import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:petcure_user/models/users.dart';
import 'package:petcure_user/utils/storage_keys.dart';
import 'package:petcure_user/views/auth/login_screen.dart';

class CoreController extends GetxController {
  Rx<Users?> currentUser = Rxn<Users>();
  Rx<String> userToken = "".obs;
  Rx<String> userType = "".obs;

  @override
  void onInit() async {
    await loadCurrentUser();
    super.onInit();
  }

  Future<void> loadCurrentUser() async {
    currentUser.value = StorageHelper.getUser();
    userToken.value = StorageHelper.getToken();
    userType.value = StorageHelper.getUserType();
    log("User token--${currentUser.value?.token}--");
    log("email: ${currentUser.value?.email}");
    log("User Type : ${userType.value}");
  }

  bool isUserLoggendIn() {
    return currentUser.value != null;
  }

  void logOut() async {
    final box = GetStorage();
    await box.write(StorageKeys.USER, null);
    await box.write(StorageKeys.ACCESS_TOKEN, null);
    await box.write(StorageKeys.USER_TYPE, null);
    Get.offAll(() => LoginScreen());
  }
}
