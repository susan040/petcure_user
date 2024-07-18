class Api {
  //office
  //static const String baseUrl = "http://192.168.1.83/Bahaal/api";

  //home
  //tatic const String baseUrl = "http://192.168.1.76/Bahaal/api";

  static const String baseUrl = "http://192.168.102.24/Bahaal/api";

  static const String loginUrl = "$baseUrl/customer_login.php";
  static const String registerUrl = "$baseUrl/register_user.php";
  static const String verifyOtpUrl = "$baseUrl/verify_otp.php";
  static const String getPropertyUrl = "$baseUrl/get_properties.php";
  static const String getAppointmentsUrl = "$baseUrl/get_user_appointment.php";
  static const String addAppointmentUrl = "$baseUrl/add_appointments.php";
  static const String cancelAppointmentUrl = "$baseUrl/cancel_appointments.php";
  static const String deleteAppointmentUrl = "$baseUrl/delete_appointment.php";
  static const String filterUrl = "$baseUrl/filter_property.php";
  static const String editProfileUrl = "$baseUrl/edit_user.php";
  static const String getRentalUrl = "$baseUrl/get_rental.php";
  static const String addRentUrl = "$baseUrl/rent_property.php";
  static const String deleteRentalUrl = "$baseUrl/delete_rental.php";
  static const String searchrUrl = "$baseUrl/search.php";
  static const String getCategoryUrl = "$baseUrl/get_categories.php";
  static const String reviewUrl = "$baseUrl/review.php";
  static const String recommendedUrl = "$baseUrl/recommended_property.php";
  static const String latestUrl = "$baseUrl/latest_property.php";
  static const String getReviewUrl = "$baseUrl/get_review.php";
  static const String getRecoUrl =
      "$baseUrl/recom_similar_property.php"; // API of recommended similar property
  static const String rentalMessageUrl = "$baseUrl/rental_message.php";
  static const String searchImageUrl = "$baseUrl/search_images.php";
}
