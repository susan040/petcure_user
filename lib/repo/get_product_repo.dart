import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:petcure_user/models/products.dart';
import 'package:petcure_user/utils/api.dart';

class GetProductRepo {
  static Future<void> getProductRepo({
    required Function(List<Products> products) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var headers = {
        'Accept': 'application/json',
      };

      var url = Uri.parse(Api.getProductUrl);
      http.Response response = await http.get(
        url,
        headers: headers,
      );
      dynamic data = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        List<Products> receipts = productsFromJson(data["data"]);
        onSuccess(receipts);
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
