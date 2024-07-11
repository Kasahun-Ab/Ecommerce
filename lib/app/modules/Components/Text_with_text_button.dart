import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextwithTextbutton extends StatelessWidget {
  final String text;
  final String textButton;
  final VoidCallback onPressed;

  TextwithTextbutton({
    Key? key,
    required this.text,
    required this.textButton,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text,
            style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 95, 95, 95),
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          TextSpan(
            text: textButton,
            style: GoogleFonts.poppins(
              color: Color(0xff115DB1),
              fontSize: 15.0,
            ),
            recognizer: TapGestureRecognizer()..onTap = onPressed,
          ),
        ],
      ),
    );
  }
}
