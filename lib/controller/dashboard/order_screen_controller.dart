import 'package:get/get.dart';
import 'package:petcure_user/models/orders.dart';
import 'package:petcure_user/repo/get_orders_repo.dart';

class OrderScreenController extends GetxController {
  RxList<OrderDetails> allOrderDetails = <OrderDetails>[].obs;

  final loading = RxBool(false);
  @override
  void onInit() {
    getAllOrders();
    super.onInit();
  }

  getAllOrders() async {
    loading.value = true;
    await GetOrderRepo.getOrderRepo(onSuccess: (orders) {
      loading.value = false;

      allOrderDetails.addAll(orders);
    }, onError: ((message) {
      loading.value = false;
    }));
  }
}
