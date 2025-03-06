import 'dart:convert';
import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import 'package:petcure_user/models/users.dart';

class StorageKeys {
  static const String USER = "user";
  static const String ACCESS_TOKEN = "accessToken";
  static const String USER_TYPE = "user_type"; // ✅ Added user type
}

class StorageHelper {
  static getToken() {
    try {
      final box = GetStorage();
      String token = box.read(StorageKeys.ACCESS_TOKEN);
      return token;
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      return null;
    }
  }

  static Users? getUser() {
    log("Fetching user");
    try {
      final box = GetStorage();
      Users user = Users.fromJson(json.decode(box.read(StorageKeys.USER)));
      return user;
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      log("Failed fetch user");
      return null;
    }
  }

  static getUserType() {
    try {
      final box = GetStorage();
      String userType = box.read(StorageKeys.USER_TYPE);
      return userType;
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      log("Failed fetch user");
      return null;
    }
  }
}
