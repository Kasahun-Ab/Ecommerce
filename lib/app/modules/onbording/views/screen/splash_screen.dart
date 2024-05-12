import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pazimo/app/routes/app_pages.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      // Navigate to the home screen using Get.offAll to clear the navigation stack
      Get.offNamed(Routes.HOME);
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
              bottom: 60,
              left: 0,
              right: 0,
              child: Center(
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    strokeWidth: 6,
                    color: Colors.blue,
                    backgroundColor: Colors.amber,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
