import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'long_button.dart';


class popupDialogbox extends StatelessWidget {
  const popupDialogbox({
    super.key,
    required this.title,
    required this.message,
    required this.onPressed,
    required this.buttontitle,
  });
  final String title;
  final String message;
  final String buttontitle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset("assets/lottie/success.json",
                width: 100, height: 100, repeat: false),
            Text(title,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff115DB1),
                    fontSize: 17)),
            SizedBox(height: 10),
            Text(
              message,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black38),
            ),
            SizedBox(height: 20),
            Button(
                title: buttontitle,
                color: Color(0xff115DB1),
                onPressed: onPressed,
                hasBorder: false,
                iconDirectionIsRight: true,
                hasIcon: false)
          ],
        ),
      ),
    );
  }
}
