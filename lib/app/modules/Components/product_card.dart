// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/modules/home/controllers/home_controller.dart';

class ProductCard extends StatelessWidget {
  ProductCard(
      {super.key,
      required this.ImageSource,
      required this.brand,
      required this.description,
      required this.price,
      this.oldprice = '',
      required this.tap,
      required this.index});
  String index;
  String ImageSource;
  String brand;
  String description;
  String price;
  String oldprice;

  RxBool isLiked = false.obs;
  final Function() tap;
  final HomeController controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    if (controller.liked.contains(index)) {
      isLiked.value = true;
    } else {
      isLiked.value = false;
    }

    return GestureDetector(
      onTap: tap,
      child: Obx(
        () => Container(
          width: 161.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 200.h,
                    width: 161.h,
                    decoration: BoxDecoration(
                        color: Color(0xFFE6E6E6),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Image.asset(
                      height: 161.h,
                      ImageSource,
                      fit: BoxFit.fill,
                    )),
                  ),
                  Positioned(
                      top: 12.h,
                      right: 12.w,
                      child: InkWell(
                        radius: 20.sp,
                        onTap: () {
                          if (isLiked.value) {
                            // controller.removeStorage(
                            //     controller.products[index]);
                            isLiked.value = false;
                          } else {
                            // controller.addStorage(
                            //     controller.products[index]);
                            isLiked.value = true;
                          }
                        },
                        child: Container(
                          width: 37.h,
                          height: 37.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: isLiked.value
                                ? SvgPicture.asset("assets/svg/liked.svg")
                                : SvgPicture.asset("assets/svg/like.svg"),
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
                      maxLines: 1,
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
                          width: 10.w,
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
      ),
    );
  }
}
