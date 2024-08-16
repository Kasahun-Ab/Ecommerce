// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

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
      getx.Get.find<OnboardingController>();

  Customerdata? userData;
  Dio? dio;

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
      dio = Dio(BaseOptions(
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
        throw Exception(
            'Failed to load products: HTTP ${response?.statusCode}');
      }
    } on DioError catch (e) {
      // Dio error handling
      if (e.type == DioErrorType.badResponse) {
        // Handle DioError with response (e.g., 404, 500, etc.)
        throw Exception(
            'Failed to load products: HTTP ${e.response?.statusCode}');
      } else if (e.type == DioErrorType.sendTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        // Handle timeouts
        throw Exception('Failed to load products: Timeout error');
      } else {
        // Handle other DioError types
        throw Exception('Failed to load products: ${e.message}');
      }
    } catch (e) {
      // Catch any other exceptions
      throw Exception('Failed to load products: $e');
    }
  }

  Future<getx.RxList> fetchBigSave() async {
    getx.RxList listOfBigSales = [].obs;
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

  Future<Response> productDetails(int id) async {
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
      getx.Get.offNamed(Routes.AUTHENTICATION);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> removeLoginResponse() async {
    await storage.remove("loginResponse");
  }

  Future<Response?> getCategories() async {
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

  Future<Response?> getWishlist() async {
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

  Future<Response?> addToWishlist(var productId) async {
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

  Future<Response?> removeFromWishlist(var productId) async {
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

  Future<Response?> changeProfile(FormData formData) async {
    formData.fields.forEach((field) {
      print('Field: ${field.key} = ${field.value}');
    });
    formData.files.forEach((file) {
      print('File of image: ${file.key} = ${file.value}');
    });
    if (dio == null) await initializeDio();

    try {
      final response = await dio!.put(
          'https://staging.mytestserver.space/api/v1/customer/profile',
          data: formData);
      return response;
    } catch (e) {
      if (e is DioError) {
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

  Future<Response?> addToCart(Map<String, dynamic> cattItem) async {
    if (dio == null) await initializeDio();
    try {
      final response = await dio!.post(
          'https://staging.mytestserver.space/api/v1/customer/cart/add/${cattItem['product_id']}',
          data: {
            "product_id": cattItem['product_id'],
            'quantity': cattItem['quantity'],
          });
      return response;
    } catch (e) {
      if (e is DioError) {
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

  Future<dynamic> getCart() async {
    if (dio == null) await initializeDio();
    try {
      final response = await dio!.get(
        'https://staging.mytestserver.space/api/v1/customer/cart',
      );
      print(response.data);
      if (response.data != null) {
        return response;
      } else {
        print("No data in the response");
        return null;
      }
    } catch (e) {
      if (e is DioError) {
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

  Future<Response?> deleteFromCart(var cartitemId) async {
    if (dio == null) await initializeDio();
    try {
      final response = await dio!.delete(
        'https://staging.mytestserver.space/api/v1/customer/cart/remove/${cartitemId}',
      );
      return response;
    } catch (e) {
      if (e is DioError) {
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

  Future<Response?> updateCart(Map<String, dynamic> quantity) async {
    if (dio == null) await initializeDio();
    try {
      final response = await dio!.put(
          'https://staging.mytestserver.space/api/v1/customer/cart/update',
          data: quantity);
      print(response.data);
      return response;
    } catch (e) {
      if (e is DioError) {
        print("Dio error occurred: ${e.message}");
        if (e.response != null) {
          print("Dio error response data: ${e.response?.data}");
        } else {
          print("No response received from the server.");
        }
      } else {
        print("Error updating cart: $e");
      }
      return null;
    }
  }

  Future<Response?> ApplyCupon(var _code) async {
    if (dio == null) await initializeDio();
    try {
      final response = await dio!.post(
          'https://staging.mytestserver.space/api/v1/customer/cart/coupon',
          data: {'code': _code});
      print(response);
      return response;
    } catch (e) {
      if (e is DioError) {
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

  Future<Response?> deleteCupon(var code) async {
    if (dio == null) await initializeDio();
    try {
      final response = await dio!.delete(
        'https://staging.mytestserver.space/api/v1/customer/cart/coupon',
      );
      return response;
    } catch (e) {
      if (e is DioError) {
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

  Future<Response?> getAddresses() async {
    if (dio == null) await initializeDio();
    try {
      final response = await dio!.get(
        'https://staging.mytestserver.space/api/v1/customer/addresses',
      );
      return response;
    } catch (e) {
      if (e is DioError) {
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
