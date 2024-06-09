// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../api/ApiConfig.dart';

class AuthenticationController extends GetxController {
  RxBool isvalidated = false.obs;
  var googleSignIn = GoogleSignIn(scopes: ['email']);
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  final _dio = Dio(BaseOptions(baseUrl: '${ApiConfig.baseUrl}'));

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
      Map<String, dynamic>? errorMessage;

      if (e.response != null) {
        errorMessage = e.response?.data['data'];
        print(errorMessage);
        if (errorMessage != null && errorMessage['message'] != null) {
          Get.snackbar(
            'Error',
            '${errorMessage['message']}',
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        } else {
          Get.snackbar(
            'Error',
            'Unknown error occurred',
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } else {
        Get.snackbar(
          'Error',
          'Network error occurred',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
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
    } on DioError catch (e) {
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

  Future<void> signInGoogle() async {
    try {
      await googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> signOut() async {
    await googleSignIn.signOut();
  }

  Future<void> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      final AccessToken accessToken = result.accessToken!;

      final userData = await FacebookAuth.instance.getUserData();
      print(userData['name']);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void onInit() {
  
    googleSignIn.onCurrentUserChanged.listen((account) {
      googleAccount.value = account;
    });
    googleSignIn.signInSilently();

    super.onInit();
  }
}
