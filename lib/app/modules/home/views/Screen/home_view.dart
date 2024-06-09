// ignore_for_file: must_be_immutable
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
// import 'package:get/get_rx/get_rx.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:pazimo/api/Api_Methods/allmethodsapi.dart';
import 'package:pazimo/app/modules/Components/CardTitle_with%20Icon.dart';
import 'package:pazimo/app/modules/Components/search_textfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pazimo/app/modules/home/controllers/home_controller.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../Shimmer/bannerShimmer.dart';
import '../../../../Shimmer/categoryShimmer.dart';
// import '../../../../Shimmer/gridproductCardShimmer.dart';
// import '../../../../data/productModel.dart';
// import '../../../Components/productCard.dart';
import 'product_details.dart';
// import '../../../Components/product_card.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final HomeController controller = Get.find<HomeController>();

  RxList bigSaleProducts = [].obs;
  RxBool bigSaveload = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: search()),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(children: [
              SizedBox(
                height: 15.h,
              ),
              Container(
                height: 100,
                child: controller.iscategories.isTrue
                    ? categoryShimmer()
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.categories.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: InkWell(
                              onTap: () async {
                                controller.getCategory();
                              },
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundImage:
                                        AssetImage("assets/images/laptop.png"),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    controller.categories[index].name,
                                    style: GoogleFonts.poppins(
                                      color: Color(0xff333333),
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
              controller.iscategories.isTrue
                  ? bannerShimmer()
                  : Container(
                      width: double.infinity,
                      height: 120.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/images/banner.png"))),
                    ),
              SizedBox(
                height: 20.h,
              ),
              CardTitle_with_icon(
                title: 'Big Save',
                subtitle: 'Top brand’s, price slashed',
                tap: () {},
              ),
              SizedBox(
                height: 12.h,
              ),
              Container(
                height: 290.h,
                width: MediaQuery.of(context).size.width,
                child: controller.iscategories.isTrue
                    ? productCardShimmer()
                    : productCard(),
              ),

              CardTitle_with_icon(
                title: "Upcoming Events",
                subtitle: "Limited time offers",
                tap: () {
                  controller.selectedIndex.value = 5;
                },
              ),
              SizedBox(
                height: 5.h,
              ),
              // Container(
              //   height: 290.h,
              //   width: MediaQuery.of(context).size.width,
              //   child: controller.iscategories.isTrue
              //       ? productCardShimmer()
              //       : ListView.builder(
              //           scrollDirection: Axis.horizontal,
              //           itemCount: controller.products.value.data.length,
              //           itemBuilder: (context, index) {
              //             print(
              //               controller.products.value.data.length,
              //             );
              //             return Obx(
              //               () => Container(
              //                 margin: EdgeInsets.only(right: 8.w),
              //                 child: ProductCard(
              //                   ImageSource:
              //                       "https://media.kingston.com/kingston/hero/ktc-articles-solutions-speed-up-your-mac-hero-lg.jpg",
              //                   description: controller
              //                       .products.value.data[index].urlKey,
              //                   price: 'ETB \$' +
              //                       "${controller.products.value.data[index].formattedPrice}",
              //                   oldprice:
              //                       NumberFormat.decimalPattern().format(8000),
              //                   tap: () async {
              //                     // await Api().fetchProductDetail(
              //                     //     controller.products[index].id);
              //                   },
              //                   id: "${controller.products.value.data[index].id}",
              //                   isLiked: true,
              //                 ),
              //               ),
              //             );
              //           }),
              // ),

              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          " Super",
                          style: GoogleFonts.poppins(
                              fontSize: 20.sp, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Deals",
                          style: GoogleFonts.poppins(
                              color: Colors.blue,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            controller.isnew.value = false;
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                                border: controller.isnew.value
                                    ? null
                                    : Border.all(width: 1, color: Colors.black),
                                color: const Color.fromARGB(255, 202, 201, 201),
                                borderRadius: BorderRadius.circular(6)),
                            child: Text("Selected"),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            controller.isnew.value = true;
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                                border: controller.isnew.value
                                    ? Border.all(width: 1, color: Colors.black)
                                    : null,
                                color: const Color.fromARGB(255, 202, 201, 201),
                                borderRadius: BorderRadius.circular(6)),
                            child: Text("new"),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              // controller.iscategories.isFalse
              //     ? gridproductCardShimmer()
              //     : Container(
              //         width: double.infinity,
              //         height: 1000,
              //         child: Center(
              //           child: GridView.builder(
              //             shrinkWrap: true,
              //             physics: NeverScrollableScrollPhysics(),
              //             padding: const EdgeInsets.all(10.0),
              //             gridDelegate:
              //                 SliverGridDelegateWithFixedCrossAxisCount(
              //               crossAxisCount: 2,
              //               crossAxisSpacing: 40,
              //               mainAxisSpacing: 2,
              //               childAspectRatio: 0.65,
              //             ),
              //             itemCount: controller.products.value.data.length,
              //             itemBuilder: (ctx, index) => ProductCard(
              //               ImageSource:
              //                   "https://img.freepik.com/free-psd/isolated-black-t-shirt-opened_125540-1283.jpg?w=740&t=st=1717745109~exp=1717745709~hmac=507d1b2ce4e5d6698346b62632771a272d9bff49db8b26f51840ba0e65bad847",
              //               description: controller
              //                   .products.value.data[index].shortDescription,
              //               price: 'ETB \$' +
              //                   NumberFormat.decimalPattern().format(controller
              //                       .products.value.data[index].price),
              //               oldprice:
              //                   NumberFormat.decimalPattern().format(8000),
              //               tap: () async {
              //                 // await Api().fetchProductDetail(
              //                 //     controller.products[index].id);
              //               },
              //               id: "${controller.products.value.data[index].id}",
              //               isLiked: true,
              //             ),
              //           ),
              //         ),
              //       )
            ]),
          ),
        ),
      ),
    );
  }

  Widget productCard() {
    print("hhhdfhdhfdhfhdfhdhfhdfhdfhdh");
    print(controller.products.value.data
        .where((element) => element.isNew == true)
        .length);
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: controller.products.value.data
          .where((element) => element.isNew == true)
          .length,
      itemBuilder: (context, index) {
        RxBool isliked = false.obs;
        isliked.value = controller.products.value.data[index].isSaved;

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
                          id: controller.products.value.data[index].id,
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
                  '${controller.products.value.data[index].name}',
                  overflow: TextOverflow.clip,
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
      },
    );
  }
}

class productCardShimmer extends StatelessWidget {
  const productCardShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                    child: Stack(
                      children: [
                        Container(
                          height: 190,
                          width: 160,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 230, 227, 227),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ],
                    ),
                    baseColor: Color.fromARGB(255, 230, 227, 227),
                    highlightColor: Color.fromARGB(220, 204, 197, 197)),
                SizedBox(
                  height: 10,
                ),
                Shimmer.fromColors(
                  baseColor: Color.fromARGB(255, 230, 227, 227),
                  highlightColor: Color.fromARGB(220, 204, 197, 197),
                  child: Container(
                    height: 10,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 230, 227, 227),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Shimmer.fromColors(
                  baseColor: Color.fromARGB(255, 230, 227, 227),
                  highlightColor: Color.fromARGB(220, 204, 197, 197),
                  child: Container(
                    height: 10,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 230, 227, 227),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ],
            ),
          );
        });
  }
}
