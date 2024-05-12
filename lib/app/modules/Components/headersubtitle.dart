import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderSubtitle extends StatelessWidget {
  final String title;

  HeaderSubtitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.poppins(fontSize: 16, color: Colors.black45),
    );
  }
}
