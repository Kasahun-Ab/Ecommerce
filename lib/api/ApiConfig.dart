// api_config.dart

class ApiConfig {
  static const String baseurl = 'https://staging.mytestserver.space/api/v1';
  static const String baseUrl = "https://pazimo.mytestserver.space/api";
  static const String loginEndpoint = "/login";
  static const String registerEndpoint = "/register";
  static const String logoutEndpoint = "/logout";
  static const String changepassword = "/password";
  static const String forgotpassword = "/forgot-password";
  static const String resetpassword = "/reset-password";
  static const String product = "/products";
  static const String productCatagories = "/product-categories";
  static const String wishlists = "/wishlists";

  static Map<String, String> getHeaders(String token) {
    return {
      'Authorization': 'Bearer $token',
    };
  }
}
