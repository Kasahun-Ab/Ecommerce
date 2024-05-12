// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CardTitle_with_icon extends StatelessWidget {
  CardTitle_with_icon({
    super.key,
    required this.title,
    this.subtitle = '',
  });
  String title;
  String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                  fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 10.w,
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.blue,
            )
          ],
        ),
        Text(
          subtitle,
          style: GoogleFonts.poppins(
              color: Color(0xFF999999),
              fontSize: 14.sp,
              fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
