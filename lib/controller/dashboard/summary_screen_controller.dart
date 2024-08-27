import 'package:get/get.dart';

class SummaryScreenController extends GetxController{
  var selectedPaymentMethod = ''.obs;

  void selectPaymentMethod(String method) {
    selectedPaymentMethod.value = method;
  }
}