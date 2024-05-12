// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/modules/home/views/Screen/product_details.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    super.key,
    required this.ImageSource,
    required this.brand,
    required this.description,
    required this.price,
    this.oldprice = '',
  });
  String ImageSource;
  String brand;
  String description;
  String price;
  String oldprice;
  RxBool isLiked = false.obs;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailView());
      },
      child: Container(
        width: 161.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180.h,
                  width: 161.h,
                  decoration: BoxDecoration(
                      color: Color(0xFFE6E6E6),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(child: Image.asset(height: 160.h, ImageSource)),
                ),
                Positioned(
                    top: 12.h,
                    right: 12.w,
                    child: InkWell(
                      radius: 20.sp,
                      onTap: () {
                        print("liked");
                      },
                      child: Container(
                        width: 34.h,
                        height: 34.h,
                        child: Center(
                          child: SvgPicture.asset("assets/svg/like.svg"),
                        ),
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              width: 161,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    brand.toUpperCase(),
                    style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF999999)),
                  ),
                  Text(
                    description,
                    style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF666666)),
                  ),
                  Row(
                    children: [
                      Text(price,
                          style: GoogleFonts.poppins(
                            color: Color(0xFF4D4D4D),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        oldprice,
                        style: GoogleFonts.poppins(
                          color: Color(0xFFB3B3B3),
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.lineThrough,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
