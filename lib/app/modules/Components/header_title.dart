import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/theme/themedata.dart';

class HeaderTitle extends StatelessWidget {
  final String title;

  HeaderTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: primary_blue,
        ),
      ),
    );
  }
}
