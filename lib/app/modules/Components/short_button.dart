import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ShortButton extends StatelessWidget {
  ShortButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.color,
  });

  final String title;
  final Function() onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 154.w,
        height: 38.h,
        decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: color,
            ),
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
