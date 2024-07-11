
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemNotFound extends StatelessWidget {
  const ItemNotFound({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size.height * 0.58,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
                "assets/svg/Search-duotone.svg"),
            SizedBox(
              height: 12,
            ),
            Text("No Results Found!",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff115DB1))),
            SizedBox(
              height: 7,
            ),
            Text(
                "Try a similar word or something \nmore general.",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Color(0xff808080),
                ))
          ],
        )));
  }
}
