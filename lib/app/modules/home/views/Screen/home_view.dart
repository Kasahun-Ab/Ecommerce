import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/modules/Components/CardTitle_with%20Icon.dart';
import 'package:pazimo/app/modules/Components/search_textfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pazimo/app/modules/home/controllers/home_controller.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../api/Api_Methods/allmethodsapi.dart';
import '../../../../../theme/themedata.dart';
import '../../../../Shimmer/bannerShimmer.dart';
import '../../../../Shimmer/categoryShimmer.dart';

import '../../../../Shimmer/gridproductCardShimmer.dart';

import '../../../../data/productModel.dart';
import '../../../Components/gridProductCard.dart';
import 'categories.dart';
import 'product_details.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  HomeView({super.key});
  final HomeController controller = Get.find<HomeController>();

  RxList bigSaleProducts = [].obs;
  RxBool bigSaveload = true.obs;
  Api _api = Api();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary_white,
      body: SafeArea(
        child: Obx(
          () => SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Good morning,",
                            style: GoogleFonts.poppins(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff999999)),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                              "${controller.userData?.data.firstName} ${controller.userData?.data.lastName} 👋",
                              style: GoogleFonts.poppins(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff333333)))
                        ],
                      ),
                      Center(child: SvgPicture.asset("assets/svg/Bell.svg"))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: search(),
              ),
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
                            padding: EdgeInsets.only(left: 20.0.w),
                            child: GestureDetector(
                              onTap: () async {
                                Get.to(() => Categories());
                              },
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 25.sp,
                                    backgroundImage:
                                        AssetImage("assets/images/laptop.png"),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Container(
                                    width: 60.w,
                                    child: Center(
                                      child: Text(
                                        maxLines: 1,
                                        overflow: TextOverflow.fade,
                                        controller.categories[index].name,
                                        style: GoogleFonts.poppins(
                                          color: Color(0xff333333),
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: controller.iscategories.isTrue
                    ? bannerShimmer()
                    : Container(
                        width: double.infinity,
                        height: 120.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.sp),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("assets/images/banner.png"))),
                      ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: CardTitle_with_icon(
                  title: 'Recommended for You',
                  subtitle: 'Top brand’s, price slashed',
                  tap: () {},
                  iconshow: false,
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
              Container(
                height: 290.h,
                width: MediaQuery.of(context).size.width,
                child: controller.iscategories.isTrue
                    ? productCardShimmer()
                    : productCard(controller.products.value.data),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CardTitle_with_icon(
                  title: "Upcoming Events",
                  subtitle: "Limited time offers",
                  tap: () {
                    controller.selectedIndex.value = 5;
                  },
                  iconshow: true,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Container(
                  height: 290.h,
                  width: MediaQuery.of(context).size.width,
                  child: controller.products.value.data.isEmpty
                      ? productCardShimmer()
                      : productCard(controller.products.value.data)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Align(
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
                                color: Color(0xff115DB1),
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
                                      : Border.all(
                                          width: 1, color: Colors.black),
                                  color:
                                      const Color.fromARGB(255, 202, 201, 201),
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
                                      ? Border.all(
                                          width: 1, color: Colors.black)
                                      : null,
                                  color:
                                      const Color.fromARGB(255, 202, 201, 201),
                                  borderRadius: BorderRadius.circular(6)),
                              child: Text("new"),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              controller.iscategories.isTrue
                  ? gridproductCardShimmer()
                  : Obx(
                      () => Container(
                        width: double.infinity,
                        height: 1600,
                        child: gridCard(controller.isnew.isTrue
                            ? controller.products.value.data
                                .where((element) => element.isBigsale == true)
                                .toList()
                            : controller.products.value.data),
                      ),
                    )
            ]),
          ),
        ),
      ),
    );
  }

  Widget productCard(
    List<Datum> product,
  ) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 16.w),
      scrollDirection: Axis.horizontal,
      itemCount: product.length,
      itemBuilder: (context, index) {
        RxBool isliked = false.obs;
        isliked.value = product[index].isSaved;

        return Obx(
          () => Container(
            width: 165.w,
            padding: EdgeInsets.only(right: 16.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => ProductDetailView(
                          id: product[index].id,
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: CachedNetworkImage(
                              height: 190.h,
                              width: 160.w,
                              fit: BoxFit.fill,
                              imageUrl: product[index].images.length != 0
                                  ? product[index].images[0].mediumImageUrl
                                  : "https://staging.mytestserver.space/public/themes/shop/default/build/assets/medium-product-placeholder-3b1a7b7d.webp",
                              placeholder: (context, url) => Center(
                                    child: CircularProgressIndicator(
                                      color: Color(0xff115DB1),
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
                                    ? SvgPicture.asset("assets/svg/liked.svg")
                                    : SvgPicture.asset("assets/svg/like.svg"),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                Text(
                  '${product[index].name}',
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
                      '${product[index].formattedPrice}',
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
        padding: EdgeInsets.symmetric(horizontal: 16),
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
