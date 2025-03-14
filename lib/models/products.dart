List<Products> productsFromJson(List<dynamic> productsJson) =>
    List<Products>.from(productsJson
        .map((productsListJson) => Products.fromJson(productsListJson)));

class Products {
  String? productId;
  String? productName;
  String? productPrice;
  String? productQuantity;
  String? productDescription;
  String? productImage;
  String? productCreatedAt;
  String? categoryId;
  String? categoryName;
  String? totalSold;
  String? totalReviews;
  List<Skus>? skus;
  List<Reviews>? reviews;
  int? averageRating;

  Products(
      {this.productId,
      this.productName,
      this.productPrice,
      this.productQuantity,
      this.productDescription,
      this.productImage,
      this.productCreatedAt,
      this.categoryId,
      this.categoryName,
      this.totalSold,
      this.totalReviews,
      this.skus,
      this.reviews,
      this.averageRating});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    productQuantity = json['product_quantity'];
    productDescription = json['product_description'];
    productImage = json['product_image'];
    productCreatedAt = json['product_created_at'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    totalSold = json['total_sold'];
    totalReviews = json['total_reviews'];
    if (json['skus'] != null) {
      skus = <Skus>[];
      json['skus'].forEach((v) {
        skus!.add(Skus.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
    averageRating = json['average_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_price'] = productPrice;
    data['product_quantity'] = productQuantity;
    data['product_description'] = productDescription;
    data['product_image'] = productImage;
    data['product_created_at'] = productCreatedAt;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['total_sold'] = totalSold;
    data['total_reviews'] = totalReviews;
    if (skus != null) {
      data['skus'] = skus!.map((v) => v.toJson()).toList();
    }
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    data['average_rating'] = averageRating;
    return data;
  }
}

class Skus {
  String? productSkuId;
  String? skuSize;
  String? skuCode;

  Skus({this.productSkuId, this.skuSize, this.skuCode});

  Skus.fromJson(Map<String, dynamic> json) {
    productSkuId = json['product_sku_id'];
    skuSize = json['sku_size'];
    skuCode = json['sku_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_sku_id'] = productSkuId;
    data['sku_size'] = skuSize;
    data['sku_code'] = skuCode;
    return data;
  }
}

class Reviews {
  String? reviewId;
  String? reviewComment;
  String? reviewRating;
  String? reviewDate;
  String? likeCount;
  User? user;

  Reviews(
      {this.reviewId,
      this.reviewComment,
      this.reviewRating,
      this.reviewDate,
      this.likeCount,
      this.user});

  Reviews.fromJson(Map<String, dynamic> json) {
    reviewId = json['review_id'];
    reviewComment = json['review_comment'];
    reviewRating = json['review_rating'];
    reviewDate = json['review_date'];
    likeCount = json['like_count'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['review_id'] = reviewId;
    data['review_comment'] = reviewComment;
    data['review_rating'] = reviewRating;
    data['review_date'] = reviewDate;
    data['like_count'] = likeCount;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? userId;
  String? userName;
  String? userEmail;
  String? userAvatar;

  User({this.userId, this.userName, this.userEmail, this.userAvatar});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userAvatar = json['user_avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['user_name'] = userName;
    data['user_email'] = userEmail;
    data['user_avatar'] = userAvatar;
    return data;
  }
}
