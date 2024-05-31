import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onbording_controller.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  OnboardingScreen({Key? key}) : super(key: key);
  final onboardingController = Get.find<OnboardingController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Container(
            child: controller.onboardingScreens[controller.pageIndex.value],
          )),
    );
  }
}
