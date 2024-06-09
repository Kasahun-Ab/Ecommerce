import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home/views/Screen/product_details.dart';

class productCard extends StatelessWidget {
  productCard({
    super.key,
    required this.bigSaleProducts,
  });

  final RxList bigSaleProducts;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bigSaleProducts.length,
        itemBuilder: (context, index) {
          RxBool isliked = false.obs;
          isliked.value = bigSaleProducts[index].isSaved;
          return Obx(
            () => Container(
              width: 165.w,
              padding: const EdgeInsets.only(right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => ProductDetailView(
                            id: bigSaleProducts[index].id,
                          ));
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: 190.h,
                          width: 160.w,
                          decoration: BoxDecoration(
                              color: Color(0xffE6E6E6),
                              borderRadius: BorderRadius.circular(10)),
                          child: CachedNetworkImage(
                              height: 190.h,
                              width: 160.w,
                              imageUrl:
                                  "https://media.kingston.com/kingston/hero/ktc-articles-solutions-speed-up-your-mac-hero-lg.jpg",
                              placeholder: (context, url) => Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.blue,
                                    ),
                                  )),
                        ),
                        Positioned(
                            top: 12.h,
                            right: 12.w,
                            child: InkWell(
                              radius: 20.sp,
                              onTap: () {
                                isliked.value = !isliked.value;
                              },
                              child: Container(
                                width: 37.h,
                                height: 37.h,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                  child: isliked.isTrue
                                      ? SvgPicture.asset("assets/svg/liked.svg")
                                      : SvgPicture.asset("assets/svg/like.svg"),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  Text(
                    '${bigSaleProducts[index].name}',
                    overflow: TextOverflow.clip,
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff808080)),
                  ),
                  Row(
                    children: [
                      Text(
                        'ETB ${bigSaleProducts[index].formattedPrice}',
                        style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff4D4D4D)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '1000',
                        style: GoogleFonts.poppins(
                            fontSize: 13.sp,
                            decoration: TextDecoration.lineThrough,
                            color: Color(0xff808080)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
