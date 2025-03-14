import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:petcure_user/utils/api.dart';

class AddOrderRepo {
  static Future<void> addOrderRepo(
      {required String userId,
      required String address,
      required List<Map<String, dynamic>> items,
      required String paymentMethod,
      required Function() onSuccess,
      required Function(String message) onError}) async {
    try {
      var headers = {
        'Accept': 'application/json',
      };

      var body = {
        'user_id': userId,
        'shipping_address': address,
        'items': jsonEncode(items),
        'payment_method': paymentMethod
      };

      http.Response response = await http.post(Uri.parse(Api.addOrderUrl),
          headers: headers, body: body);

      log(json.encode(body));
      log(response.body);

      dynamic data = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        onSuccess();
      } else {
        onError(data["message"]);
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Sorry something went wrong");
    }
  }
}
