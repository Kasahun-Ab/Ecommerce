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
                          : GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 32.0,
                                mainAxisSpacing: 16.0,
                                childAspectRatio: 0.73,
                              ),
                              itemCount: _wishlist.value.data.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () async {
                                    Get.to(() => ProductDetailView(
                                          id: controller
                                              .products.value.data[index].id,
                                        ));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top: Radius.circular(10),
                                                bottom: Radius.circular(10),
                                              ),
                                              child: Container(
                                                height: 290,
                                                color: Color.fromARGB(
                                                    195, 105, 105, 105),
                                                child: Stack(
                                                  children: [
                                                    // Image.network(
                                                    //     width: 270,
                                                    //     fit: BoxFit.cover,
                                                    //     "https://p7.hiclipart.com/preview/364/581/66/airpods-apple-earbuds-headphones-iphone-apple.jpg"),
                                                    CachedNetworkImage(
                                                      height: 290,
                                                      imageUrl:
                                                          "https://p7.hiclipart.com/preview/364/581/66/airpods-apple-earbuds-headphones-iphone-apple.jpg",
                                                      placeholder: (context,
                                                              url) =>
                                                          CircularProgressIndicator(),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Icon(Icons.error),
                                                    ),

                                                    Positioned(
                                                        top: 12.h,
                                                        right: 12.w,
                                                        child: InkWell(
                                                          radius: 20.sp,
                                                          onTap: () async {
                                                            EasyLoading.show(
                                                                status:
                                                                    'loading...');
                                                            await _api
                                                                .addToWishlist(
                                                                    _wishlist
                                                                        .value
                                                                        .data[
                                                                            index]
                                                                        .product
                                                                        .id);
                                                            await getWish();
                                                          },
                                                          child: Container(
                                                            width: 37.h,
                                                            height: 37.h,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                            child: Center(
                                                              child: SvgPicture
                                                                  .asset(
                                                                      "assets/svg/liked.svg"),
                                                            ),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                _wishlist.value.data[index]
                                                    .product.name,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                              SizedBox(height: 4),
                                              Row(
                                                children: [
                                                  Text(
                                                    '${_wishlist.value.data[index].product.formattedPrice}',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 30,
                                                  ),
                                                  Text(
                                                    '${NumberFormat.decimalPattern().format(8000)}',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
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
