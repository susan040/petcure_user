import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:petcure_user/models/category.dart';
import 'package:petcure_user/utils/api.dart';

class GetCategoryRepo {
  static Future<void> getCategoryRepo({
    required Function(List<Categories> categories) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var headers = {
        'Accept': 'application/json',
      };

      var url = Uri.parse(Api.getCategoryUrl);
      http.Response response = await http.get(
        url,
        headers: headers,
      );
      dynamic data = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        List<Categories> categories = categoryFromJson(data["data"]);
        onSuccess(categories);
      } else {
        onError(data["message"]);
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Sorry! something went wrong");
    }
  }
}
