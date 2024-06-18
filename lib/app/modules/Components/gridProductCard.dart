import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/data/productModel.dart';
import 'package:pazimo/app/modules/home/controllers/home_controller.dart';

import '../../../api/Api_Methods/allmethodsapi.dart';
import '../../Shimmer/gridproductCardShimmer.dart';
import '../home/views/Screen/product_details.dart';

HomeController controller = Get.find<HomeController>();
Api _api = Api();
Widget gridCard(List<Datum> product) {
  return product.length == 0
      ? gridproductCardShimmer()
      : GridView.builder(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
          ),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 2,
            childAspectRatio: 0.75,
          ),
          itemCount: product.length,
          itemBuilder: (ctx, index) {
            RxBool isliked = false.obs;
            isliked.value = product[index].isSaved;
            return Obx(
              () => Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(() => ProductDetailView(
                              id: controller.products.value.data[index].id,
                            ));
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 190.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color(0xffE6E6E6),
                                borderRadius: BorderRadius.circular(10)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  height: 190.h,
                                  width: 160.w,
                                  imageUrl: controller.products.value
                                              .data[index].images.length !=
                                          0
                                      ? controller.products.value.data[index]
                                          .images[0]['medium_image_url']
                                      : "https://staging.mytestserver.space/public/themes/shop/default/build/assets/medium-product-placeholder-3b1a7b7d.webp",
                                  placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.blue,
                                        ),
                                      )),
                            ),
                          ),
                          Positioned(
                              top: 12.h,
                              right: 12.w,
                              child: InkWell(
                                radius: 20.sp,
                                onTap: () async {
                                  isliked.value = !isliked.value;
                                  await _api.addToWishlist(product[index].id);
                                  await controller.getWishlist();
                                },
                                child: Container(
                                  width: 37.h,
                                  height: 37.h,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: isliked.isTrue
                                        ? SvgPicture.asset(
                                            "assets/svg/liked.svg")
                                        : SvgPicture.asset(
                                            "assets/svg/like.svg"),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                    Text(
                      '${controller.products.value.data[index].name}',
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff808080)),
                    ),
                    Row(
                      children: [
                        Text(
                          'ETB ${controller.products.value.data[index].formattedPrice}',
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
          });
}
