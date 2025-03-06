import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:petcure_user/controller/core_controller.dart';
import 'package:petcure_user/models/category.dart';
import 'package:petcure_user/utils/api.dart';

class GetCategoryRepo {
  static Future<void> getCategoryRepo({
    required Function(List<Categories> categories) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var coreController = Get.find<CoreController>();
      var token = coreController.currentUser.value?.token ?? "";
      var headers = {'Authorization': 'Bearer $token'};

      var url = Uri.parse(Api.getCategoryUrl);
      http.Response response = await http.get(url, headers: headers);

      dynamic data = json.decode(response.body);
      log("Data: $data");

      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (data["data"] == null || data["data"] is! List) {
          onError("Invalid data format received.");
          return;
        }

        List<Categories> categories = data["data"]
            .map<Categories>((item) => Categories.fromJson(item))
            .toList();

        onSuccess(categories);
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Sorry! Something went wrong");
    }
  }
}
