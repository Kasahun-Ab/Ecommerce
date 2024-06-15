import 'package:dio/dio.dart' as dioClient;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../app/data/Customer.dart';
import '../../app/data/productModel.dart';
import '../../app/modules/home/controllers/home_controller.dart';
import '../../app/modules/onbording/controllers/onbording_controller.dart';
import '../../app/routes/app_pages.dart';
import '../ApiConfig.dart';

class Api {
  GetStorage storage = GetStorage();
  final OnboardingController onboardingController =
      Get.find<OnboardingController>();

  Customerdata? userData;
  dioClient.Dio? dio;

  Future<Customerdata?> getLoginResponse() async {
    try {
      final data = await storage.read('loginResponse');
      if (data != null) {
        userData = CustomerdataFromJson(data);
        return userData;
      }
    } catch (e) {
      print('Error reading loginResponse: $e');
    }
    return null;
  }

  Future<void> initializeDio() async {
    await getLoginResponse();

    if (userData != null) {
      dio = dioClient.Dio(dioClient.BaseOptions(
        baseUrl: ApiConfig.baseurl,
        headers: ApiConfig.getHeaders(userData!.token),
      ));
    } else {
      throw Exception('User data is not available');
    }
  }

  Future<Product> fetchProducts() async {
    if (dio == null) {
      await initializeDio();
    }
    try {
      final response =
          await dio?.get("https://staging.mytestserver.space/api/v1/products");
      if (response?.statusCode == 200) {
        var data = response?.data;
        Product productResponse = Product.fromJson(data);
        return productResponse;
      } else {
        throw Exception('Failed to load products: ${response?.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  Future<RxList> fetchBigSave() async {
    RxList listOfBigSales = [].obs;
    if (dio == null) {
      await initializeDio();
    }
    try {
      final response = await dio!.get(ApiConfig.product);
      if (response.statusCode == 200) {
        var data = response.data;
        Product productResponse = Product.fromJson(data);
        listOfBigSales.value = productResponse.data
            .where((element) => element.isNew == true)
            .toList();
        return listOfBigSales;
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  Future<dioClient.Response> productDetails(int id) async {
    if (dio == null) {
      await initializeDio();
    }
    try {
      var response = await dio!.get("${ApiConfig.product}/$id");
      return response;
    } catch (error) {
      throw error;
    }
  }

  Future<void> logout(HomeController homeController) async {
    if (dio == null) await initializeDio();
    removeLoginResponse();
    try {
      final response = await dio!.post('/${ApiConfig.logoutEndpoint}');
      if (response.statusCode == 201) {
        print(response.data);
      }
      homeController.close();
      Get.offNamed(Routes.AUTHENTICATION);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> removeLoginResponse() async {
    await storage.remove("loginResponse");
  }

  Future<dioClient.Response?> getCategories() async {
    if (dio == null) await initializeDio();
    try {
      final response = await dio!
          .get('https://staging.mytestserver.space/api/v1/categories');
      return response;
    } catch (e) {
      print("Error fetching categories: $e");
      return null;
    }
  }

  Future<dioClient.Response?> getWishlist() async {
    if (dio == null) await initializeDio();
    try {
      final response = await dio!
          .get('https://staging.mytestserver.space/api/v1/customer/wishlist');
      return response;
    } catch (e) {
      print("Error fetching wishlist: $e");
      return null;
    }
  }

  Future<dioClient.Response?> addToWishlist(var productId) async {
    if (dio == null) await initializeDio();
    try {
      final response = await dio!.post(
          'https://staging.mytestserver.space/api/v1/customer/wishlist/$productId');
      print(response.data);
      return response;
    } catch (e) {
      print("Error adding to wishlist: $e");
      return null;
    }
  }

  Future<dioClient.Response?> removeFromWishlist(var productId) async {
    if (dio == null) await initializeDio();
    try {
      final response = await dio!.delete(
          'https://staging.mytestserver.space/api/v1/customer/wishlist/$productId');
      return response;
    } catch (e) {
      print("Error removing from wishlist: $e");
      return null;
    }
  }

  Future<dioClient.Response?> changeProfile(
      Map<String, dynamic> formData) async {
    if (dio == null) await initializeDio();
    try {
      final response = await dio!.put(
          'https://staging.mytestserver.space/api/v1/customer/profile',
          data: formData);
      return response;
    } catch (e) {
      if (e is dioClient.DioError) {
        print("Dio error occurred: ${e.message}");
        if (e.response != null) {
          print("Dio error response data: ${e.response?.data}");
        }
      } else {
        print("Error updating profile: $e");
      }
      return null;
    }
  }
}
