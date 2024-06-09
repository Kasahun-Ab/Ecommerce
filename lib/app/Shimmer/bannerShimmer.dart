import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class bannerShimmer extends StatelessWidget {
  const bannerShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Container(
       width:MediaQuery.of(context).size.width,
          height: 120.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color.fromARGB(255, 230, 227, 227)),
        ),
        baseColor: Color.fromARGB(255, 230, 227, 227),
        highlightColor: Color.fromARGB(220, 204, 197, 197));
  }
}
