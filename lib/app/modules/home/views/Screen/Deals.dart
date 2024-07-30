import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/data/productModel.dart';
import 'package:pazimo/app/modules/home/controllers/home_controller.dart';

import '../../../../../api/Api_Methods/allmethodsapi.dart';
import '../../../../../theme/themedata.dart';
import 'product_details.dart';

class DealsController extends GetxController {
  RxInt selectedindex = 0.obs;
  final RxList<String> catigories =
      ["Hotdeals", "Black Friday", "Student discount", "Free shipping"].obs;
}

// ignore: must_be_immutable
class Dealsview extends StatelessWidget {
  Dealsview({super.key});
  DealsController dealsController = Get.put(DealsController());
  CarouselController buttonCarouselController = CarouselController();
  HomeController controller = Get.find<HomeController>();
  Api _api = Api();
  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'https://cdn.pixabay.com/photo/2020/10/21/18/07/laptop-5673901_640.jpg',
      'https://cdn.pixabay.com/photo/2015/01/08/18/25/desk-593327_1280.jpg',
      'https://cdn.pixabay.com/photo/2016/11/23/13/40/iphone-1852901_1280.jpg',
      'https://cdn.pixabay.com/photo/2015/12/15/03/56/macbook-1093641_1280.jpg',
    ];

    return Scaffold(
      backgroundColor: primary_white,
      appBar: AppBar(
        backgroundColor: primary_white,
        centerTitle: true,
        title: Text(
          "Deals",
          style: GoogleFonts.poppins(
              color: Color(0xff115DB1),fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 120,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: images
                    .map((item) => ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            imageUrl: item,
                            fit: BoxFit.cover,
                            width: 400,
                          ),
                        ))
                    .toList(),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 30,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: dealsController.catigories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Obx(
                      () => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: InkWell(
                          onTap: () {
                            dealsController.selectedindex.value = index;
                          },
                          child: Column(
                            children: [
                              Text(
                                "${dealsController.catigories[index]}",
                                style: GoogleFonts.poppins(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              dealsController.selectedindex.value == index
                                  ? Container(
                                      width: 10 *
                                          dealsController.catigories[index]
                                              .characters.length
                                              .toDouble(),
                                      height: 4,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 280,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 12,
                            children: [
                              Text(
                                "Today’s Sale!",
                                style: GoogleFonts.poppins(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color:
                                          Color.fromARGB(123, 172, 209, 243)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 1),
                                  child: Text(
                                    "02:43:21",
                                    style: GoogleFonts.poppins(
                                        color: Color(0xff115DB1)),
                                  )),
                            ],
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "See all",
                              style: GoogleFonts.poppins(
                                  fontSize: 16, color: Color(0xff115DB1)),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 240,
                        child: productCard(controller.products.value.data,
                            'assets/images/clock.png')),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 370,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "Hot Deals",
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "Limited Hot offers",
                        style: GoogleFonts.poppins(color: Color(0xff999999)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 240,
                        child: productCard(controller.products.value.data,
                            'assets/images/fire.png')),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget productCard(List<Datum> product, String icon) {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 16),
      scrollDirection: Axis.horizontal,
      itemCount: product.length,
      itemBuilder: (context, index) {
        RxBool isliked = false.obs;
        isliked.value = product[index].isSaved;

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
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                              height: 190.h,
                              width: 160.w,
                              fit: BoxFit.cover,
                              imageUrl:
                                  "https://staging.mytestserver.space/public/storage/product/1/3HkD9EA1t2dXiFdfrrxyNvvfB6Ku5meZQ84rXfwp.webp",
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
                            onTap: isliked.isFalse
                                ? () async {
                                    isliked.value = !isliked.value;
                                    await _api.addToWishlist(product[index].id);
                                  }
                                : () async {
                                    isliked.value = !isliked.value;
                                    await _api
                                        .removeFromWishlist(product[index].id);
                                  },
                            child: Container(
                              width: 37.h,
                              height: 37.h,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Image.asset(icon),
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
