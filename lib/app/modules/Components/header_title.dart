import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderTitle extends StatelessWidget {
  final String title;

  HeaderTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: Color(0xff115DB1),
      ),
    );
  }
}
