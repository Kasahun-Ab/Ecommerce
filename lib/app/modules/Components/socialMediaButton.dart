import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/theme/themedata.dart';

class SigninSocialButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPressed;
  final bool hasBorder;
  final bool iconDirectionIsRight;
  final String iconSource;
  final Color textColor;
  final bool hasIcon;
  final bool isapple;
  SigninSocialButton({
    Key? key,
    required this.title,
    required this.color,
    required this.onPressed,
    required this.hasBorder,
    required this.iconDirectionIsRight,
    this.iconSource = '',
    this.textColor = Colors.white,
    required this.hasIcon,
    required this.isapple
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: hasBorder ? Colors.white : color, // background color
        side: hasBorder
            ? BorderSide(
                width: 1.w,
                color: primary_back,
              )
            : BorderSide.none, // border color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.sp),
        ),
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconDirectionIsRight
              ? Container()
              : SvgPicture.asset(
                  width: 30.w,
                  iconSource,
                  color: isapple?textColor:null,
                ),
          SizedBox(width: 5.w),
          Text(
            title,
            style: GoogleFonts.poppins(
              color: hasBorder ? color : textColor,
              fontWeight: FontWeight.w500,
              fontSize: 17.sp,
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
