import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchButton extends StatelessWidget {
  final Size size;
  final String title;
  final Color bg;
  final Color textcolor;
  final String icon;
  final Function() tap;
  SearchButton({
    required this.size,
    required this.title,
    required this.bg,
    required this.textcolor,
    required this.icon,
    required this.tap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        width: size.width / 2.4,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.amber),
          color: bg,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(icon),
              SizedBox(width: 10),
              Text(
                title,
                style: GoogleFonts.poppins(
                  color: textcolor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}