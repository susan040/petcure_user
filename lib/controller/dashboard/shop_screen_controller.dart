import 'package:get/get.dart';
import 'package:petcure_user/models/category.dart';
import 'package:petcure_user/models/products.dart';
import 'package:petcure_user/repo/add_order_repo.dart';
import 'package:petcure_user/repo/get_category_repo.dart';
import 'package:petcure_user/repo/get_product_repo.dart';
import 'package:petcure_user/utils/custom_snackbar.dart';
import 'package:petcure_user/views/dashboard/order_success_screen.dart';

class ShopScreenController extends GetxController {
  var selectedCategory = ''.obs;

  void toggleSelection(String category) {
    if (selectedCategory.value == category) {
      selectedCategory.value = ''; // Deselect the category
    } else {
      selectedCategory.value = category;
    }
    print("Selected category: ${selectedCategory.value}"); // Debug log
    filterProductsByCategory(); // Trigger product filtering
  }

  final selectedPayment = ''.obs;
  void updateSelectedPayment(String payment) {
    selectedPayment.value = payment;
  }

  RxList<Products> allProducts = <Products>[].obs;
  RxList<Categories> allCategories = <Categories>[].obs;

  final loading = RxBool(false);
  @override
  void onInit() {
    getAllCategories();
    super.onInit();
  }

  getAllCategories() async {
    loading.value = true;
    await GetCategoryRepo.getCategoryRepo(onSuccess: (categories) {
      loading.value = false;
      allCategories.addAll(categories);
      filterProductsByCategory();
    }, onError: (message) {
      loading.value = false;
    });
  }

  getAllProducts({String? category}) async {
    loading.value = true;
    await GetProductRepo.getProductRepo(onSuccess: (products) {
      loading.value = false;
      if (category != null && category.isNotEmpty) {
        allProducts.assignAll(
            products.where((product) => product.categoryName == category));
      } else {
        allProducts.assignAll(products);
      }
    }, onError: (message) {
      loading.value = false;
      CustomSnackBar.error(message: message, title: "Product Fetch Error");
    });
  }

  void filterProductsByCategory() {
    if (selectedCategory.value == "All") {
      getAllProducts();
    } else {
      getAllProducts(category: selectedCategory.value);
    }
  }

  addOrders(String productId, String userId, String shippingAddress,
      String paymentMethod, String quantity) async {
    loading.value = true;
    await AddOrderRepo.addOrderRepo(
        userId: userId,
        address: shippingAddress,
        items: [
          {"product_id": productId, "quantity": quantity}
        ],
        paymentMethod: paymentMethod,
        onSuccess: () {
          CustomSnackBar.success(
              title: "Order Successful", message: "Order placed successfully");
          Get.offAll(() => const OrderSuccessScreen());
        },
        onError: (message) {
          loading.value = false;
          CustomSnackBar.error(message: message, title: "Order Error");
        });
  }

  int getRemainingQuantity(Products product) {
    int productQuantity = int.tryParse(product.productQuantity ?? '0') ?? 0;
    int totalSold = int.tryParse(product.totalSold ?? '0') ?? 0;

    return productQuantity - totalSold;
  }

  void updateProductQuantities() {
    for (var product in allProducts) {
      int remaining = getRemainingQuantity(product);
      print('Remaining quantity for ${product.productName}: $remaining');
    }
  }
}
