import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:petcure_user/controller/core_controller.dart';
import 'package:petcure_user/models/users.dart';
import 'package:petcure_user/utils/api.dart';
import 'package:http_parser/http_parser.dart';
import 'package:petcure_user/utils/http_request.dart';

class EditProfileRepo {
  static Future<void> editProfile({
    required String name,
    required String address,
    required String phoneNumber,
    required String gender,
    required File? image,
    required Function(Users user) onSuccess,
    required Function(String message) onError,
  }) async {
    var coreController = Get.find<CoreController>();
    var userId = coreController.currentUser.value!.userId.toString();
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    var url = Uri.parse(Api.editUserUrl);
    http.MultipartRequest request = http.MultipartRequest("POST", url);
    request.headers.addAll((headers));
    request.fields['user_id'] = userId;
    request.fields['name'] = name;
    request.fields['address'] = address;
    request.fields['phone_number'] = phoneNumber;
    request.fields['gender'] = gender;
    if (image != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          "image",
          image.path,
          contentType: MediaType("image", "*"),
        ),
      );
    }
    http.StreamedResponse response =
        await HttpRequestPetCare.multiPart(request);
    var responseData = await response.stream.bytesToString();
    var data = jsonDecode(responseData);
    log("User data:$data");
    if (response.statusCode >= 200 && response.statusCode < 300) {
      Users user = Users.fromJson(data["data"]);
      onSuccess(user);
    } else {
      onError(data['message']);
    }
  }
}
