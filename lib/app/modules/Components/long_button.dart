import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPressed;
  final bool hasBorder;
  final bool iconDirectionIsRight;
  final String iconSource;
  final Color textColor;
  final bool hasIcon;

  Button({
    Key? key,
    required this.title,
    required this.color,
    required this.onPressed,
    required this.hasBorder,
    required this.iconDirectionIsRight,
    this.iconSource = '',
    this.textColor = Colors.white,
    required this.hasIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: hasBorder ? Colors.white : color, // Background color
        // onPrimary: hasBorder ? color : textColor, // Text color
        side: hasBorder
            ? BorderSide(
                width: 1.w,
                color: color,
              )
            : BorderSide.none, // Border color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.sp),
        ),
        minimumSize: Size(MediaQuery.of(context).size.width, 55.h),
        padding: EdgeInsets.zero, // Remove internal padding
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconDirectionIsRight
              ? Container()
              : SvgPicture.asset(iconSource,
                  width: 24.w), // Adjust icon size as needed
          SizedBox(width: 10.w),
          Text(
            title,
            style: GoogleFonts.poppins(
              color: hasBorder ? color : textColor,
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(width: 10.w),
          hasIcon
              ? (iconDirectionIsRight
                  ? Icon(Icons.arrow_forward, color: Colors.white)
                  : Container())
              : Container(),
        ],
      ),
    );
  }
}
