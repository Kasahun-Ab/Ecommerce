
import 'package:dio/dio.dart' as dioClient;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../app/data/LoginResponse.dart';
import '../../app/data/productModel.dart';
import '../../app/data/whishlist.dart';

import '../../app/modules/home/controllers/home_controller.dart';
import '../../app/modules/onbording/controllers/onbording_controller.dart';
import '../../app/routes/app_pages.dart';
import '../ApiConfig.dart';

class Api {
  GetStorage storage = GetStorage();
  final OnboardingController controller = Get.find<OnboardingController>();

  LoginResponse? userData;
  dioClient.Dio? dio;

  dioClient.Dio? _dio =
      dioClient.Dio(dioClient.BaseOptions(baseUrl: ApiConfig.baseurl));

  Future<LoginResponse?> getLoginResponse() async {
    try {
      final data = await storage.read('loginResponse');
      if (data != null) {
        userData = LoginResponse.fromJson(Map<String, dynamic>.from(data));
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
        baseUrl: ApiConfig.baseUrl,
        headers: ApiConfig.getHeaders(userData!.token),
      ));
    } else {
      throw Exception('User data is not available');
    }
  }

  

  Future<ProductResponse> fetchProducts() async {
    // Ensure Dio is initialized
    if (_dio == null) {
      await initializeDio();
    }
    try {
      final response = await _dio!.get("/${ApiConfig.product}");
      if (response.statusCode == 200) {
        var data = response.data;
        ProductResponse productResponse = ProductResponse.fromJson(data);
        print(productResponse.data[0].name);

        return productResponse;
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  Future feachBigSave() async {
    RxList listofBigSales=[].obs;
    if (_dio == null) {
      await initializeDio();
    }
    try {
      final response = await _dio!.get("/${ApiConfig.product}");
      if (response.statusCode == 200) {
        var data = response.data;
        ProductResponse productResponse = ProductResponse.fromJson(data);
           listofBigSales.value=  productResponse.data.where((element) => element.isBigSale==true).toList();

        return  listofBigSales;
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
  Future<dioClient.Response> productDetails(int id) async {
    dioClient.Dio dio = dioClient.Dio();
    try {
      var response = await dio
          .get("https://staging.mytestserver.space/api/v1/products/164");
      print(response.data);
      return response; // Return the response if needed
    } catch (error) {
      print(error);
      throw error; // Rethrow the error to handle it outside of this method if needed
    }
  }

  Future<List<whishlistmodel>> feachWhishlist() async {
    if (dio == null) await initializeDio();

    try {
      final response = await dio!.get("${ApiConfig.wishlists}");
      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data['data'];
        List<whishlistmodel> wishlists = (data['data'] as List)
            .map((productJson) => whishlistmodel.fromJson(productJson))
            .toList();
        print(wishlists.length);
        return wishlists;
      } else {
        throw Exception(
            'Failed to load data: Unexpected status code ${response.statusCode}');
      }
    } catch (e) {
      print('Unexpected error: $e');
      throw Exception('Failed to load data: Unexpected error $e');
    }
  }

  Future<void> logout(HomeController controller) async {
    controller.close();
    if (dio == null) await initializeDio();
    removeLoginResponse();
    try {
      final response = await dio!.post('/${ApiConfig.logoutEndpoint}');
      if (response.statusCode == 201) {
        print(response.data);
      }

      Get.offNamed(Routes.AUTHENTICATION);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> removeLoginResponse() async {
    await storage.remove("loginResponse");
  }

  Future<dioClient.Response?> getCategories() async {
    try {
      final response = await _dio!.get('/categories');
      return response;
    } catch (e) {
      print("Error fetching categories: $e");
      return null;
    }
  }
}
