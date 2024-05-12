import 'package:flutter/material.dart';
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
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 48,
        decoration: BoxDecoration(
          color: hasBorder ? Colors.white : color,
          borderRadius: BorderRadius.circular(6),
          border: hasBorder
              ? Border.all(
                  width: 1,
                  color: color,
                )
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconDirectionIsRight
                ? Container()
                : SvgPicture.asset(iconSource),
            SizedBox(width: 10),
            Text(
              title,
              style: GoogleFonts.poppins(
                color: hasBorder ? color : textColor,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            SizedBox(width: 10),
            hasIcon
                ? (iconDirectionIsRight
                    ? Icon(Icons.arrow_forward, color: Colors.white)
                    : Container())
                : Container(),
          ],
        ),
      ),
    );
  }
}
