// // ignore_for_file: constant_identifier_names

// import 'dart:convert';
// import 'dart:developer';

// import 'package:bahaal_user/models/user.dart';
// import 'package:get_storage/get_storage.dart';

// class StorageKeys {
//   static const String USER = "user";
//   static const String ACCESS_TOKEN = "accessToken";
// }

// class StorageHelper {
//   static getToken() {
//     try {
//       final box = GetStorage();
//       String token = box.read(StorageKeys.ACCESS_TOKEN);
//       return token;
//     } catch (e, s) {
//       log(e.toString());
//       log(s.toString());
//       return null;
//     }
//   }

//   static Users? getUser() {
//     log("Fetching user");
//     try {
//       final box = GetStorage();
//       Users user = Users.fromJson(json.decode(box.read(StorageKeys.USER)));
//       return user;
//     } catch (e, s) {
//       log(e.toString());
//       log(s.toString());
//       log("Failed fetch user");
//       return null;
//     }
//   }
// }
