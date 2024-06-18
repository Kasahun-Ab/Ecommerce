import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pazimo/api/Api_Methods/allmethodsapi.dart';
import 'package:pazimo/app/modules/home/controllers/home_controller.dart';

// import '../../../../../api/ApiConfig.dart';
// import '../../../../data/productModel.dart';
import '../../../../Shimmer/gridproductCardShimmer.dart';
import '../../../../data/whishlist.dart';
import 'product_details.dart';

// ignore: must_be_immutable
class SavedItemsPage extends StatelessWidget {
  RxBool _isloading = false.obs;
  Api _api = Api();

  final HomeController controller = Get.find<HomeController>();
  var _wishlist = Wishlist(data: []).obs;

  getWishlist() async {
    _isloading.value = true;
    final response = await _api.getWishlist();
    if (response?.statusCode == 200) {
      var data = response!.data;
      _isloading.value = false;
      controller.wishlist.value = Wishlist.fromJson(data);
      _wishlist.value = Wishlist.fromJson(data);
    }
  }

  getWish() async {
    final response = await _api.getWishlist();
    if (response?.statusCode == 200) {
      var data = response!.data;
      controller.wishlist.value = Wishlist.fromJson(data);
      _wishlist.value = Wishlist.fromJson(data);
      EasyLoading.dismiss();
    }
  }

  @override
  Widget build(BuildContext context) {
    getWishlist();
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: Text('Saved Items'),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Obx(
              () => _isloading.isTrue
                  ? gridproductCardShimmer(
                      length: 10,
                    )
                  : Obx(
                      () => _wishlist.value.data.length == 0
                          ? Center(
                              child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/svg/large_love.svg"),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "No Saved Items!",
                                  style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blue),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "You don’t have any saved \nitems. Go to home and add\n some",
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff808080)),
                                ),
                              ],
                            ))
                          : Obx(
                              () => GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 15,
                                  mainAxisSpacing: 2,
                                  childAspectRatio: 0.75,
                                ),
                                itemCount: _wishlist.value.data.length,
                                itemBuilder: (context, index) {
                                  print(_wishlist.value.data.length);
                                  return Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.to(() => ProductDetailView(
                                                  id: _wishlist.value
                                                      .data[index].product.id,
                                                ));
                                          },
                                          child: Stack(
                                            children: [
                                              Container(
                                                height: 190.h,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    color: Color(0xffE6E6E6),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: CachedNetworkImage(
                                                      fit: BoxFit.cover,
                                                      height: 190.h,
                                                      width: 160.w,
                                                      imageUrl: _wishlist
                                                                  .value
                                                                  .data[index]
                                                                  .product
                                                                  .images
                                                                  .length !=
                                                              0
                                                          ? _wishlist
                                                              .value
                                                              .data[index]
                                                              .product
                                                              .images[0]
                                                              .mediumImageUrl
                                                          : "https://staging.mytestserver.space/public/themes/shop/default/build/assets/medium-product-placeholder-3b1a7b7d.webp",
                                                      placeholder: (context,
                                                              url) =>
                                                          Center(
                                                            child:
                                                                CircularProgressIndicator(
                                                              color:
                                                                  Colors.blue,
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
                                                      EasyLoading.show(
                                                          status: 'loading...');
                                                          
                                                      await _api.addToWishlist(
                                                          _wishlist
                                                              .value
                                                              .data[index]
                                                              .product
                                                              .id);
                                                      await getWish();
                                                    },
                                                    child: Container(
                                                      width: 37.h,
                                                      height: 37.h,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: Center(
                                                        child: SvgPicture.asset(
                                                            "assets/svg/liked.svg"),
                                                      ),
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        ),
                                        Text(
                                          '${_wishlist.value.data[index].product.name}',
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
                                              '${_wishlist.value.data[index].product.formattedPrice}',
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
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  color: Color(0xff808080)),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                    ),
            )));
  }

  // id(String productId) {
  //   for (var item in controller.wishlist) {
  //     if (item.productId == productId) {
  //       return item.id;
  //     }
  //   }
  //   return null;
  // }
}
