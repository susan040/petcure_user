// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcure_user/constant/esewa.dart';
import 'package:petcure_user/controller/dashboard/shop_screen_controller.dart';
import 'package:esewa_flutter_sdk/esewa_config.dart';
import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';
import 'package:esewa_flutter_sdk/esewa_payment.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';
import 'package:petcure_user/utils/custom_snackbar.dart';

class Esewa {
  final c = Get.put(ShopScreenController());
  pay(String productId, String userId, String shippingAddress,
      String paymentMethod, String quantity) {
    try {
      EsewaFlutterSdk.initPayment(
        esewaConfig: EsewaConfig(
          environment: Environment.test,
          clientId: kEsewaClientId,
          secretId: kEsewaSecretKey,
        ),
        esewaPayment: EsewaPayment(
          productId: "1d71jd81",
          productName: "Product One",
          productPrice: "20",
          callbackUrl: '',
        ),
        onPaymentSuccess: (EsewaPaymentSuccessResult data) {
          debugPrint(":::SUCCESS::: => $data");
          // verifyTransactionStatus(data);
          c.addOrders(
              productId, userId, shippingAddress, paymentMethod, quantity);
        },
        onPaymentFailure: (data) {
          debugPrint(":::FAILURE::: => $data");
          CustomSnackBar.error(title: "Payment", message: "Payment Failure");
        },
        onPaymentCancellation: (data) {
          debugPrint(":::CANCELLATION::: => $data");
          CustomSnackBar.info(title: "Payment", message: "Payment Cancel");
        },
      );
    } on Exception catch (e) {
      debugPrint("EXCEPTION : ${e.toString()}");
    }
  }

  void verifyTransactionStatus(EsewaPaymentSuccessResult result) async {}
}
