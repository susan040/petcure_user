List<OrderDetails> ordersFromJson(List<dynamic> ordersJson) =>
    List<OrderDetails>.from(ordersJson
        .map((ordersListJson) => OrderDetails.fromJson(ordersListJson)));

class OrderDetails {
  String? orderId;
  String? shippingAddress;
  String? orderTotalPrice;
  String? orderStatus;
  String? orderCreatedAt;
  String? orderUpdatedAt;
  String? paymentMethod;
  String? paymentStatus;
  String? paymentAmount;
  String? paymentCreatedAt;
  UserDetails? userDetails;
  List<Items>? items;

  OrderDetails(
      {this.orderId,
      this.shippingAddress,
      this.orderTotalPrice,
      this.orderStatus,
      this.orderCreatedAt,
      this.orderUpdatedAt,
      this.paymentMethod,
      this.paymentStatus,
      this.paymentAmount,
      this.paymentCreatedAt,
      this.userDetails,
      this.items});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    shippingAddress = json['shipping_address'];
    orderTotalPrice = json['order_total_price'];
    orderStatus = json['order_status'];
    orderCreatedAt = json['order_created_at'];
    orderUpdatedAt = json['order_updated_at'];
    paymentMethod = json['payment_method'];
    paymentStatus = json['payment_status'];
    paymentAmount = json['payment_amount'];
    paymentCreatedAt = json['payment_created_at'];
    userDetails = json['user_details'] != null
        ? UserDetails.fromJson(json['user_details'])
        : null;
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['shipping_address'] = shippingAddress;
    data['order_total_price'] = orderTotalPrice;
    data['order_status'] = orderStatus;
    data['order_created_at'] = orderCreatedAt;
    data['order_updated_at'] = orderUpdatedAt;
    data['payment_method'] = paymentMethod;
    data['payment_status'] = paymentStatus;
    data['payment_amount'] = paymentAmount;
    data['payment_created_at'] = paymentCreatedAt;
    if (userDetails != null) {
      data['user_details'] = userDetails!.toJson();
    }
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserDetails {
  String? userId;
  String? name;
  String? email;
  String? phoneNumber;
  String? gender;
  String? address;
  String? userType;
  String? image;

  UserDetails(
      {this.userId,
      this.name,
      this.email,
      this.phoneNumber,
      this.gender,
      this.address,
      this.userType,
      this.image});

  UserDetails.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    gender = json['gender'];
    address = json['address'];
    userType = json['user_type'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['name'] = name;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['gender'] = gender;
    data['address'] = address;
    data['user_type'] = userType;
    data['image'] = image;
    return data;
  }
}

class Items {
  String? productId;
  String? productName;
  String? productImageUrl;
  String? categoryId;
  String? categoryName;
  String? quantity;
  String? itemTotalPrice;

  Items(
      {this.productId,
      this.productName,
      this.productImageUrl,
      this.categoryId,
      this.categoryName,
      this.quantity,
      this.itemTotalPrice});

  Items.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productImageUrl = json['product_image_url'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    quantity = json['quantity'];
    itemTotalPrice = json['item_total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_image_url'] = productImageUrl;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['quantity'] = quantity;
    data['item_total_price'] = itemTotalPrice;
    return data;
  }
}
