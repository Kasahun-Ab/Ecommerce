import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:pazimo/app/modules/Components/headersubtitle.dart';

// Import custom components and controller
import '../../../Components/header_title.dart';
import '../../../Components/text_with_text_button.dart';
import '../../../Components/long_button.dart';

// View for OTP Screen
class OtpView extends StatelessWidget {
   OtpView({Key? key}) : super(key: key);
//  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Back button
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                HeaderTitle(title: 'Enter 4 Digit Code'),
                const SizedBox(height: 10),
                // Subtitle
                HeaderSubtitle(
                  title:
                      'Enter the 4-digit code that you received on your phone number (+251 978767211).',
                ),
              ],
            ),
            Column(
              children: [
                // OTP Text Field
                OtpTextField(
                  fieldWidth: 65,
                  textStyle: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
                  ),
                  numberOfFields: 4,
                  borderColor: Colors.blue,
                  focusedBorderColor: Colors.blue,
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {},
                  onSubmit: (String verificationCode) {},
                ),
                const SizedBox(height: 10),
                // Text with Button
                TextwithTextbutton(
                  text: "Email not received?",
                  textButton: "Resend code",
                  onPressed: () {
                    // Implement functionality for resend code
                  },
                ),
              ],
            ),
            // Continue Button
            Button(
              title: "Continue",
              color: Colors.blue,
              onPressed: () {
                // Implement functionality for continue button
              },
              hasBorder: false,
              iconDirectionIsRight: true,
              hasIcon: false,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
