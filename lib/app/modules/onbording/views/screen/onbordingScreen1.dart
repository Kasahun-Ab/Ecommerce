import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/modules/onbording/controllers/onbording_controller.dart';
import '../../../../../theme/themedata.dart';
import '../../../Components/long_button.dart';
// import '../controllers/onbording_controller.dart';

class OnboardingScreen1 extends StatelessWidget {
  final int index;
  final String hero;
  final int positionOfText;
  final String imageSource;
  final int positionOfSvgImage;
  final String pathSource;
  final Color textColor;

  const OnboardingScreen1({
    Key? key,
    required this.index,
    required this.hero,
    required this.positionOfText,
    required this.imageSource,
    required this.positionOfSvgImage,
    required this.pathSource,
    this.textColor = Colors.amber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final onboardingController = Get.find<OnboardingController>();

    return Scaffold(
      backgroundColor: primary_white,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            SizedBox(
              child: SvgPicture.asset(pathSource),
            ),
            Positioned(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 25),
                child: Text(
                  hero,
                  style: GoogleFonts.poppins(
                    height: 1,
                    color: textColor,
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Positioned(
              right: -150,
              bottom: 30,
              child: SizedBox(
                height: 500,
                child: Image.asset(imageSource),
              ),
            ),
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
                      title: onboardingController.buttonNames[index],
                      color: Colors.blue,
                      onPressed: () => onboardingController.slidingOnboarding(),
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
