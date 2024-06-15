// api_config.dart

class ApiConfig {
  static const String baseurl = 'https://staging.mytestserver.space/api/v1';
  static const String loginEndpoint = "/customer/login";
  static const String registerEndpoint = "/customer/register";
  static const String logoutEndpoint = "/customer/logout";
  static const String changepassword = "/password";
  static const String forgotpassword = "/forgot-password";
  static const String resetpassword = "/reset-password";
  static const String product = "/products";
  static const String categories = '/categories';
  static const String productCatagories = "/product-categories";
  static const String wishlists = "customer/wishlist";
  static const String cart = "/customer/cart";

  static Map<String, String> getHeaders(String token) {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }
}
