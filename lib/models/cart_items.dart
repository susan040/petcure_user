List<CartItems> cartItemsFromJson(List<dynamic> cartItemsJson) =>
    List<CartItems>.from(cartItemsJson
        .map((cartItemsListJson) => CartItems.fromJson(cartItemsListJson)));

class CartItems {
  String? cartId;
  String? cartItemId;
  String? productId;
  String? productSkuId;
  String? quantity;
  String? categoryId;
  String? categoryName;
  String? productName;
  String? price;
  String? image;
  bool? isSelected;

  CartItems(
      {this.cartId,
      this.cartItemId,
      this.productId,
      this.productSkuId,
      this.quantity,
      this.categoryId,
      this.categoryName,
      this.productName,
      this.price,
      this.image,
      this.isSelected});

  CartItems.fromJson(Map<String, dynamic> json) {
    cartId = json['cart_id'];
    cartItemId = json['cart_item_id'];
    productId = json['product_id'];
    productSkuId = json['product_sku_id'];
    quantity = json['quantity'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    productName = json['product_name'];
    price = json['price'];
    image = json['image'];
    isSelected = json['isSelected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cart_id'] = cartId;
    data['cart_item_id'] = cartItemId;
    data['product_id'] = productId;
    data['product_sku_id'] = productSkuId;
    data['quantity'] = quantity;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['product_name'] = productName;
    data['price'] = price;
    data['image'] = image;
    data['isSelected'] = isSelected;
    return data;
  }
}
