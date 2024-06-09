import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pazimo/app/data/LoginResponse.dart';
import 'package:pazimo/app/modules/onbording/views/screen/onbordingScreen1.dart';
import 'package:pazimo/app/modules/onbording/views/screen/onbordingScreen2.dart';
import 'package:pazimo/app/modules/onbording/views/screen/onbordingScreen3.dart';
import 'package:pazimo/app/routes/app_pages.dart';

class OnboardingController extends GetxController {
  @override
  
  void onInit() async {
    checkLogin();
    onborging.value = await _storage.read("onborging") ?? "start";
    super.onInit();
  }

  Future<void> checkLogin() async {
    var user = await _storage.read("loginResponse");
    if (user != null) {
      // print(user);
      userData = LoginResponse.fromJson(user);
      print(userData!.token);
    } else {
      userData = null;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  RxString onborging = "".obs;
  LoginResponse? userData;
  final RxInt pageIndex = 0.obs;
  final _storage = GetStorage();

  List<String> buttonNames = ["Get started", "What else", "Let's do it"];

  List<Widget> onboardingScreens = [
    OnboardingScreen1(
      index: 0,
      hero: 'Quality\nShopping\nat Your\nFingertips!',
      pathSource: 'assets/svg/onbording_path1.svg',
      positionOfText: 0,
      imageSource: 'assets/images/women.png',
      positionOfSvgImage: 0,
    ),
    OnboardingScreen2(
      index: 1,
      hero: 'Fast, Green \nDelivery \nwith Our \nElectric \nBikes!',
      pathSource: 'assets/svg/onbording_path2.svg',
      positionOfText: 0,
      imageSource: 'assets/images/motor.png',
      positionOfSvgImage: 0,
    ),
    OnboardingScreen3(
      index: 2,
      hero: 'Earn as \nYou Shop \n- Join Our \nAffiliate \nProgram!',
      pathSource: 'assets/svg/onbording_path2.svg',
      postionOftext: 0,
      textColor: Colors.blue,
      imageSource: 'assets/images/bitcoin.png',
      positionOfSvgImage: 0,
    ),
  ];

  void SaveEndOnbording() {
    _storage.write("onborging", "end");
  }

  void slidingOnboarding() {
    if (pageIndex.value == 2) {
      SaveEndOnbording();
      Get.offNamed(Routes.AUTHENTICATION);
    } else {
      pageIndex.value++;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
