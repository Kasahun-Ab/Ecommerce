import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pazimo/app/modules/onbording/controllers/onbording_controller.dart';
import 'package:pazimo/app/modules/onbording/views/SplashScreen.dart';
import 'package:pazimo/app/routes/app_pages.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final OnboardingController controller = Get.put(OnboardingController());
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      controller.onborging.value == "end"
          ? (controller.userData != null && controller.userData!.token != "")
              ? Get.offNamed(Routes.HOME)
              : Get.offNamed(Routes.AUTHENTICATION)
          : Get.off(() => OnboardingScreen());
    });

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Upper path SVG
            SizedBox(
              width: double.infinity,
              height: 260,
              child: SvgPicture.asset(
                "assets/svg/upper_path.svg",
                fit: BoxFit.cover,
              ),
            ),
            // Logo
            Center(
              child: Image.asset(
                "assets/images/pazimo_logo.png",
                height: 100,
              ),
            ),
            // Lower path SVG
            Positioned(
              bottom: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 240,
                child: SvgPicture.asset(
                  "assets/svg/lower_path.svg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Circular Progress Indicator
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Lottie.asset(
                  height: 200,
                  width: 200,
                  "assets/lottie/loading.json",
                  repeat: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
