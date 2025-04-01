import 'package:get/get.dart';
import 'package:petcure_user/models/cart_items.dart';
import 'package:petcure_user/repo/add_cart_repo.dart';
import 'package:petcure_user/repo/get_cart_item_repo.dart';
import 'package:petcure_user/utils/custom_snackbar.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class MyCartScreenController extends GetxController {
  var isAllSelected = false.obs;
  var deliveryCharge = 20.0.obs; // Example delivery charge
  var totalAmount = 0.0.obs;
  RxList<CartItems> allCartItems = <CartItems>[].obs;
  var itemQuantities = <String, RxString>{}.obs;
  final loading = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    getAllCartItems();
    updateTotalAmount();
  }

  // Select or deselect individual item
  void toggleSelect(CartItems item) {
    item.isSelected = !(item.isSelected ?? false);
    updateTotalAmount();
  }

  // Select or deselect all items
  void toggleSelectAll() {
    isAllSelected.value = !isAllSelected.value;
    allCartItems.forEach((item) {
      item.isSelected = isAllSelected.value;
    });
    updateTotalAmount();
  }

  void increaseQuantity(String cartItemId) {
    var itemIndex =
        allCartItems.indexWhere((element) => element.cartItemId == cartItemId);
    if (itemIndex != -1) {
      int qty = int.tryParse(allCartItems[itemIndex].quantity ?? "0") ?? 0;
      allCartItems[itemIndex].quantity = (qty + 1).toString();
      allCartItems.refresh(); // Force UI update
    }
  }

  // Decrease quantity
  void decreaseQuantity(String cartItemId) {
    var itemIndex =
        allCartItems.indexWhere((element) => element.cartItemId == cartItemId);
    if (itemIndex != -1) {
      int qty = int.tryParse(allCartItems[itemIndex].quantity ?? "1") ?? 1;
      if (qty > 1) {
        allCartItems[itemIndex].quantity = (qty - 1).toString();
        allCartItems.refresh(); // Force UI update
      }
    }
  }

  // Load cart items from JSON (simulate API response)
  void loadCartItems(List<dynamic> jsonCartItems) {
    allCartItems.value = cartItemsFromJson(jsonCartItems);
  }

  // Update total amount based on selected items
  void updateTotalAmount() {
    double total = 0.0;
    for (var item in allCartItems) {
      if (item.isSelected ?? false) {
        total += double.parse(item.price ?? '0') *
            int.parse(itemQuantities[item.cartItemId ?? '']?.value ?? '1');
      }
    }
    totalAmount.value = total + deliveryCharge.value;
  }

  getAllCartItems() async {
    loading.value = true;

    await GetCartItemRepo.getCartItemRepo(
      onSuccess: (cartItems) {
        loading.value = false;

        // allCartItems.clear();
        allCartItems.addAll(cartItems);
      },
      onError: (message) {
        loading.value = false;
        Get.snackbar("Error", message);
      },
    );
  }

  final loadings = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);
  addToCart(String productId, String quanity, String productSkuId) async {
    loadings.show(message: "Please wait..");
    await AddCartRepo.addCartRepo(
        productId: productId,
        productSkuId: productSkuId,
        quantity: quanity,
        onSuccess: () {
          loadings.hide();

          CustomSnackBar.success(
              title: "Add To Cart", message: "Add To Cart successfully");
        },
        onError: (message) {
          loadings.hide();
          CustomSnackBar.error(message: message, title: "Add To Cart");
        });
  }
}
