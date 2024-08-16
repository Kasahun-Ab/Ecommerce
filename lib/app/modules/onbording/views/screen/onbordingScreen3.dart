import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/modules/onbording/controllers/onbording_controller.dart';

import '../../../../../theme/themedata.dart';
import '../../../Components/long_button.dart';

// ignore: must_be_immutable
class OnboardingScreen3 extends StatelessWidget {
  OnboardingScreen3({
    super.key,
    required this.index,
    required this.hero,
    required this.pathSource,
    required this.postionOftext,
    required this.imageSource,
    required this.positionOfSvgImage,
    this.textColor = Colors.amber,
  });

  int index;
  String hero;
  int postionOftext;
  String imageSource;
  int positionOfSvgImage;
  String pathSource;
  Color textColor;

  @override
  Widget build(BuildContext context) {
    final findController = Get.find<OnboardingController>();

    return Scaffold(
      backgroundColor: primary_white,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),

            // SVG Image
            SizedBox(
              child: SvgPicture.asset(pathSource),
            ),

            // Background Image
            Positioned(
              top: -50,
              child: Container(
                height: 500,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  imageSource,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Hero Text
            Positioned(
              bottom: 120,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  hero,
                  textAlign: index == 2 ? TextAlign.right : null,
                  style: GoogleFonts.poppins(
                    height: 1,
                    color: textColor,
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),

            // Button
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.white,
                height: 110,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Button(
                      title: findController.buttonNames[index],
                      color: Colors.blue,
                      onPressed: () => findController
                          .slidingOnboarding(), // Assuming slidingOnboarding method requires no arguments
                      hasBorder: false,
                      iconDirectionIsRight: true,
                      hasIcon: true,
                    ),
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
