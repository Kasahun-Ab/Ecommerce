import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onbording_controller.dart';


class OnboardingScreen extends GetView<OnboardingController> {
   OnboardingScreen({Key? key}) : super(key: key);
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  PageView.builder(
          itemCount: controller.onboardingScreens.length,
          controller: controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            controller.pageIndex.value = index;
            
            return controller.onboardingScreens[index];
          },
        ),
    );
  }
}
