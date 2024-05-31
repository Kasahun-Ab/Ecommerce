// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:pazimo/app/data/LoginResponse.dart';
import '../../../../api/ApiConfig.dart';

class AuthenticationController extends GetxController {
  RxBool isvalidated = false.obs;
  // final googleSignIn = GoogleSignIn();

  final _dio = Dio(BaseOptions(baseUrl: '${ApiConfig.baseUrl}'));

  // Future<GoogleSignInAccount?> signInWithGoogle() async {
  //   try {
  //     final result = await googleSignIn.signIn();
  //     return result;
  //   } on Exception {
  //     return null;
  //   }
  // }

  Future login(
    String password,
    String phone,
  ) async {
    try {
      final response = await _dio.post(
        '${ApiConfig.loginEndpoint}',
        data: {
          'phone': phone,
          'password': password,
        },
      );

      return response;
    } on DioError catch (e) {
      String errorMessage;

      if (e.response != null) {
        // ${e.response?.statusCode} -
        print(e.response!.data["data"].toString());
        errorMessage = 'Error:  ${e.response?.data['data']}';
        print(errorMessage);
        Get.snackbar(
            backgroundColor: Colors.red,
            colorText: Colors.white,
            'Error',
            '$errorMessage');
      } else {
        errorMessage = 'Error: ${e.message}';
        print(errorMessage);
        Get.snackbar(
            backgroundColor: Colors.red,
            colorText: Colors.white,
            'Error 2',
            '$errorMessage');
      }
    } catch (e) {
      print(e);
      return Future.error("An unexpected error occurred");
    }
  }

  Future register(String name, String password, String phone) async {
    try {
      
      final response = await _dio.post('${ApiConfig.registerEndpoint}', data: {
        "name": name,
        "password": password,
        "password_confirmation": password,
        "phone": phone
      });

      return response;
    } 
    on DioError catch (e) {
      String errorMessage;
      if (e.response != null) {
        errorMessage = 'Error: ${e.response?.statusCode} - ${e.response?.data}';
        Get.snackbar(
            backgroundColor: Colors.red,
            colorText: Colors.white,
            'Error',
            '$errorMessage');
      } else {
        errorMessage = 'Error: ${e.message}';
        Get.snackbar(
            backgroundColor: Colors.red,
            colorText: Colors.white,
            'Error',
            '$errorMessage');
      }
    } catch (e) {
      return Future.error("An unexpected error occurred");
    }
  }

  Forgotpassword() {
    _dio.post("", data: {});
  }

  ResetPassword() {
    _dio.post("", data: {});
  }

  @override
  void onInit() {
    super.onInit();
  }
}
