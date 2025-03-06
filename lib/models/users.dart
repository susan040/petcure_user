class Users {
  String? userId;
  String? name;
  String? email;
  String? phoneNumber;
  String? password;
  String? gender;
  String? address;
  String? userType;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? token;

  Users(
      {this.userId,
      this.name,
      this.email,
      this.phoneNumber,
      this.password,
      this.gender,
      this.address,
      this.userType,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.token});

  Users.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    password = json['password'];
    gender = json['gender'];
    address = json['address'];
    userType = json['user_type'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['name'] = name;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['password'] = password;
    data['gender'] = gender;
    data['address'] = address;
    data['user_type'] = userType;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['token'] = token;
    return data;
  }
}
