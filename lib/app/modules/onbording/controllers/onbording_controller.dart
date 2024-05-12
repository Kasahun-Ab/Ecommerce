import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pazimo/app/modules/onbording/views/screen/onbordingScreen1.dart';
import 'package:pazimo/app/modules/onbording/views/screen/onbordingScreen2.dart';
import 'package:pazimo/app/modules/onbording/views/screen/onbordingScreen3.dart';
import 'package:pazimo/app/routes/app_pages.dart';


class OnboardingController extends GetxController {

  @override
  void onInit() async{
  //  await Future.delayed(Duration(seconds: 5), () {
  //    Get.off(OnbordingScreen());
  //   });
    super.onInit();
  }
  final PageController pageController = PageController();
  final RxInt pageIndex = 0.obs;
  final _storage = GetStorage();

    List<String> buttonNames = [
    "Get started",
    "What else",
    "Let's do it"
  ];

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
   
  void SaveEndOnbording(){
 _storage.write("onborging", "end");
  }

  void slidingOnboarding() {
    if (pageIndex.value > 1) {
      SaveEndOnbording();
      Get.offNamed(Routes.AUTHENTICATION);
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
      );
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
