// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../../../../api/ApiConfig.dart';

class AuthenticationController extends GetxController {
  RxBool isvalidated = false.obs;
  var googleSignIn = GoogleSignIn(scopes: ['email']);
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  final _dio = Dio(BaseOptions(headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  }, baseUrl: '${ApiConfig.baseurl}'));

  Future login(
    String password,
    String phone,
  ) async {
    print("love");
    try {
      final response = await _dio.post(
        '${ApiConfig.loginEndpoint}',
        data: {
          'phone': phone,
          'password': password,
          'device_name': "android12"
        },
      );

      print(response);
      return response;
    } on DioError catch (e) {
      Map<String, dynamic> errorMessage;

      if (e.response != null) {
        errorMessage = e.response!.data;

        Get.snackbar(
          'Error',
          '${errorMessage["message"]}',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
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
    List<String> names = name.split(' ');
    try {
      final response = await _dio.post('${ApiConfig.registerEndpoint}', data: {
        "first_name": names[0],
        'last_name': names[1],
        "password": password,
        "password_confirmation": password,
        "phone": phone
      });
      print(response.data);
      return response;
    } on DioError catch (e) {
      Map<String, dynamic> errorMessage;

      if (e.response != null) {
        errorMessage = e.response!.data;
        Get.snackbar(
            backgroundColor: Colors.red,
            colorText: Colors.white,
            'Unable to Register',
            '$errorMessage["message"]');
      } else {
        errorMessage = e.response!.data;
        Get.snackbar(
            backgroundColor: Colors.red,
            colorText: Colors.white,
            'Unable to Register',
            '$errorMessage["message"]');
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

  Future<void> signinApple() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      print(credential);
    } catch (error) {}
  }

  Future<void> signOut() async {
    await googleSignIn.signOut();
  }

  Future<void> signInWithFacebook() async {
    try {
      // final LoginResult result = await FacebookAuth.instance.login();
      // final AccessToken accessToken = result.accessToken!;
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
