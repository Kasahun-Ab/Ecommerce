import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pazimo/app/modules/home/controllers/home_controller.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../api/Api_Methods/allmethodsapi.dart';
import '../../../../../theme/themedata.dart';
import '../../../../Shimmer/gridproductCardShimmer.dart';

import '../../../../data/productModel.dart';
import '../../../Components/gridProductCard.dart';
import 'categoriousDetails.dart';
import 'product_details.dart';

class Shop extends StatelessWidget {
  Shop({super.key});
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    // var categories = ["All", "AirPods", "Cerave", "Laptops", "Clothes"];
    var selectedCatigories = 'aut'.obs;
    return Scaffold(
      backgroundColor: primary_white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 10),
              Text(
                "Shop",
                style: GoogleFonts.poppins(
                    color: primary_blue,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SearchBar(),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  width: double.infinity,
                  height: 120.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/banner.png"))),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => CategoryPage());
                      },
                      child: Text(
                        "See all",
                        style: GoogleFonts.poppins(
                            fontSize: 16, color: Color(0xff115DB1)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 30,
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.categories.length,
                    itemBuilder: ((context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 15),
                        child: InkWell(
                          onTap: () {
                            selectedCatigories.value =
                                controller.categories[index].name;
                          },
                          child: Obx(
                            () => Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1,
                                      color: selectedCatigories.value ==
                                              controller.categories[index].name
                                          ? Colors.transparent
                                          : Colors.black),
                                  color: selectedCatigories.value ==
                                          controller.categories[index].name
                                      ? const Color.fromARGB(255, 0, 0, 0)
                                      : Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    controller.categories[index].name,
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: selectedCatigories.value ==
                                                controller
                                                    .categories[index].name
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                )),
                          ),
                        ),
                      );
                    })),
              ),
              SizedBox(height: 10),
              Obx(() {
                if (controller.isLoading.isFalse) {
                  return gridproductCardShimmer();
                } else {
                  return Container(
                    width: double.infinity,
                    height:
                        140 * controller.products.value.data.length.toDouble(),
                    child: gridCard(controller.products.value.data),
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }

  // Widget gridCard(List<Datum> product) {
  //   RxBool isliked = false.obs;
  //   return product.length == 0
  //       ? gridproductCardShimmer()
  //       : GridView.builder(
  //           padding: EdgeInsets.only(
  //             left: 16,
  //             right: 16,
  //             top: 16,
  //           ),
  //           shrinkWrap: true,
  //           physics: NeverScrollableScrollPhysics(),
  //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //             crossAxisCount: 2,
  //             crossAxisSpacing: 15,
  //             mainAxisSpacing: 2,
  //             childAspectRatio: 0.7,
  //           ),
  //           itemCount: product.length,
  //           itemBuilder: (ctx, index) {
  //             isliked.value = product[index].isSaved;
  //             return Obx(
  //               () => Container(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     InkWell(
  //                       onTap: () {
  //                         Get.to(() => ProductDetailView(
  //                               id: controller.products.value.data[index].id,
  //                             ));
  //                       },
  //                       child: Stack(
  //                         children: [
  //                           Container(
  //                             height: 190.h,
  //                             width: double.infinity,
  //                             decoration: BoxDecoration(
  //                                 color: Color(0xffE6E6E6),
  //                                 borderRadius: BorderRadius.circular(10)),
  //                             child: CachedNetworkImage(
  //                                 height: 190.h,
  //                                 width: 160.w,
  //                                 imageUrl:
  //                                     "https://media.kingston.com/kingston/hero/ktc-articles-solutions-speed-up-your-mac-hero-lg.jpg",
  //                                 placeholder: (context, url) => Center(
  //                                       child: CircularProgressIndicator(
  //                                         color: Color(0xff115DB1),
  //                                       ),
  //                                     )),
  //                           ),
  //                           Positioned(
  //                               top: 12.h,
  //                               right: 12.w,
  //                               child: InkWell(
  //                                 radius: 20.sp,
  //                                 onTap: () {
  //                                   isliked.value = !isliked.value;
  //                                 },
  //                                 child: Container(
  //                                   width: 37.h,
  //                                   height: 37.h,
  //                                   decoration: BoxDecoration(
  //                                       color: Colors.white,
  //                                       borderRadius: BorderRadius.circular(5)),
  //                                   child: Center(
  //                                     child: isliked.isTrue
  //                                         ? SvgPicture.asset(
  //                                             "assets/svg/liked.svg")
  //                                         : SvgPicture.asset(
  //                                             "assets/svg/like.svg"),
  //                                   ),
  //                                 ),
  //                               ))
  //                         ],
  //                       ),
  //                     ),
  //                     Text(
  //                       '${controller.products.value.data[index].name}',
  //                       overflow: TextOverflow.clip,
  //                       maxLines: 1,
  //                       style: GoogleFonts.poppins(
  //                           fontSize: 14,
  //                           fontWeight: FontWeight.w500,
  //                           color: Color(0xff808080)),
  //                     ),
  //                     Row(
  //                       children: [
  //                         Text(
  //                           'ETB ${controller.products.value.data[index].formattedPrice}',
  //                           style: GoogleFonts.poppins(
  //                               fontSize: 16.sp,
  //                               fontWeight: FontWeight.w700,
  //                               color: Color(0xff4D4D4D)),
  //                         ),
  //                         SizedBox(
  //                           width: 10,
  //                         ),
  //                         Text(
  //                           '1000',
  //                           style: GoogleFonts.poppins(
  //                               fontSize: 13.sp,
  //                               decoration: TextDecoration.lineThrough,
  //                               color: Color(0xff808080)),
  //                         ),
  //                       ],
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             );
  //           });
  // }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black),
          borderRadius: BorderRadius.circular(40)),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16),
            // child: Image.asset("assets/images/logo.png"),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "|",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
              child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 4, bottom: 4, left: 10),
              hintText: 'Search...',
              border: InputBorder.none,
            ),
          )),
          Container(
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                color: Color(0xff115DB1),
                borderRadius: BorderRadius.circular(30)),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            child: SvgPicture.asset(
              "assets/svg/search.svg",
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

// Widget buildShimmerList() {
//   return ;
// }


// Container(
//           width: double.infinity,
//           child: Column(
//             children: [
//               Image.network(
//                   "https://p7.hiclipart.com/preview/364/581/66/airpods-apple-earbuds-headphones-iphone-apple.jpg"),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('iPhone 14 Pro 128 GB'),
//                   Row(
//                     children: [
//                       Text('ETB 78,000'),
//                       SizedBox(
//                         width: 20,
//                       ),
//                       Text('79,000'),
//                     ],
//                   )
//                 ],
//               )
//             ],
//           ),
//         );

//  Shimmer.fromColors(
//           baseColor: Colors.grey[300]!,
//           highlightColor: Colors.grey[100]!,
//           child: Card(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   height: 120.0,
//                   color: Colors.white,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     height: 20.0,
//                     width: double.infinity,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Container(
//                     height: 20.0,
//                     width: 100.0,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );