import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:petcure_user/controller/core_controller.dart';
import 'package:petcure_user/utils/api.dart';

class AddCartRepo {
  static Future<void> addCartRepo(
      {required String productId,
      required String productSkuId,
      required String quantity,
      required Function() onSuccess,
      required Function(String message) onError}) async {
    try {
      final coreController = Get.find<CoreController>();
      var token = coreController.currentUser.value!.token.toString();
      var headers = {
        'Accept': 'application/json',
      };

      var body = {
        'token': token,
        'product_id': productId,
        'product_sku_id': productSkuId,
        'quantity': quantity,
        'isSelected': "false"
      };

      http.Response response = await http.post(Uri.parse(Api.addToCartUrl),
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
