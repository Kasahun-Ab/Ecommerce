import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Iconbutton extends StatelessWidget {
  const Iconbutton({super.key, required this.onTap, required this.icon});

  final Function() onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border:
              Border.all(color: Color.fromARGB(214, 71, 70, 70), width: 2.w),
        ),
        child: Center(
          child: Icon(
            color: Colors.black,
            size: 16.sp,
            icon,
          ),
        ),
        height: 30.h,
        width: 30.w,
      ),
    );
  }
}
