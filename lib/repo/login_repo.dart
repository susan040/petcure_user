import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:petcure_user/models/users.dart';
import 'package:petcure_user/utils/api.dart';

class LoginRepo {
  static Future<void> login({
    required String email,
    required String password,
    required Function(Users user, String token, String userType) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
      };
      var body = {
        "email": email,
        "password": password,
      };
      http.Response response = await http.post(Uri.parse(Api.loginUrl),
          headers: headers, body: body);
      dynamic data = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        String accessToken = json.encode(["token"]);
        Users user = Users.fromJson(data["data"]);
        String userType = data["data"]["user_type"]; // Extract user_type
        onSuccess(user, accessToken, userType);
      } else {
        onError(data["message"]);
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Sorry, something went wrong");
    }
  }
}
