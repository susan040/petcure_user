import 'package:get/get.dart';

class MyCartScreenController extends GetxController {
  final RxInt quantity = 1.obs;

  void increment() {
    quantity.value++;
  }

  void decrement() {
    if (quantity.value > 0) {
      quantity.value--;
    }
  }

  var isSelected = false.obs;

  void toggleSelection() {
    isSelected.value = !isSelected.value;
  }

  var isSelectedAll = false.obs;

  void toggleSelectionAll() {
    isSelectedAll.value = !isSelectedAll.value;
  }
}
