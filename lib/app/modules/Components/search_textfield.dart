import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pazimo/app/modules/home/views/Screen/search_view.dart';

import '../../../theme/themedata.dart';

class search extends StatelessWidget {
  const search({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.sp),
        border: Border.all(color: primary_back, width: 1.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(4.0.w),
            child: Container(
              width: 30.w,
              height: 30.h,
              child: Image.asset(
                "assets/images/logo.png",
                width: 30.w,
                height: 30.h,
              ),
            ),
          ),
          Text(
            "|",
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
              child: TextField(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  Get.to(() => SearchView());
                },
                decoration: InputDecoration(
                  hintText: "Search for clothes....",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0.w),
            child: Container(
              width: 53.w,
              height: 32.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color: primary_blue,
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Icon(
                Icons.search,
                size: 28.sp,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    offset: Offset(0, 0),
                    blurRadius: 5,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
