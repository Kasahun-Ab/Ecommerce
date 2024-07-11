import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/modules/home/controllers/home_controller.dart';

import '../../../../../api/Api_Methods/allmethodsapi.dart';
import '../../../../Shimmer/gridproductCardShimmer.dart';
import '../../../../data/productModel.dart';
import '../../../Components/gridProductCard.dart';
import '../../../Components/search_textfield.dart';

import 'product_details.dart';

class CategoryController extends GetxController {
  var mostUsed = [
    {'name': 'T-shirt', 'icon': "assets/images/phone.png"},
    {'name': 'Facial', 'icon': "assets/images/tshirt.png"},
    {'name': 'Phone', 'icon': "assets/images/sunscreen.png"},
    {'name': 'Laptop', 'icon': "assets/images/tv.png"},
    {'name': 'Laptop', 'icon': "assets/images/tv.png"},
    {'name': 'Phone', 'icon': "assets/images/sunscreen.png"},
    {'name': 'Facial', 'icon': "assets/images/tshirt.png"},
    {'name': 'T-shirt', 'icon': "assets/images/phone.png"},
  ].obs;

  var otherCategories = [
    {'name': 'Phone', 'icon': 'assets/svg/desktop.svg'},
    {'name': 'Audio Equipment', 'icon': 'assets/svg/mic.svg'},
    {'name': 'Car Equipment', 'icon': 'assets/svg/car.svg'},
    {'name': 'Video Game Consoles', 'icon': 'assets/svg/group.svg'},
  ].obs;

  RxInt selectedIndex = 0.obs;
}

class Categories extends StatelessWidget {
  HomeController controller = Get.find<HomeController>();
  final CategoryController _controller = Get.put(CategoryController());

  // ["Category", "Price", "All Filters","Sale", "Free Shipping", "Recommended"]
  @override
  Widget build(BuildContext context) {
    List<String> catigoriy = [
      'Sale',
      'Free Shipping',
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Electronics'),
        // actions: [
        //   PopupMenuButton<String>(
        //     onSelected: (value) {},
        //     itemBuilder: (context) => [
        //       PopupMenuItem(
        //         value: 'Free Shipping',
        //         child: Text('Free Shipping'),
        //       ),
        //       PopupMenuItem(
        //         value: 'Recommended',
        //         child: Text('Recommended'),
        //       ),
        //       PopupMenuItem(
        //         value: 'Price',
        //         child: Text('Price'),
        //       ),
        //     ],
        //   ),
        //   IconButton(
        //     icon: Icon(Icons.filter_list),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Color(0xffE6E6E6),
                            borderRadius: BorderRadius.circular(30)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Text("Sale")),
                    Container(
                        decoration: BoxDecoration(
                            color: Color(0xffE6E6E6),
                            borderRadius: BorderRadius.circular(30)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Text("Free Shipping")),
                    Container(
                        decoration: BoxDecoration(
                            color: Color(0xffE6E6E6),
                            borderRadius: BorderRadius.circular(30)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Recommended"),
                            Icon(size: 15, Icons.keyboard_arrow_down)
                          ],
                        )),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Color(0xffE6E6E6),
                            borderRadius: BorderRadius.circular(30)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: InkWell(
                          onTap: () {
                            Get.bottomSheet(
                              Container(
                                height: 600,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15))),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, right: 16, top: 30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Search Bar
                                      search(),
                                      SizedBox(height: 16.0),
                                      // Most Used Categories
                                      Text('Most used',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(height: 15.0),
                                      Obx(() {
                                        return GridView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount:
                                              _controller.mostUsed.length,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4,
                                            mainAxisSpacing: 8,
                                            crossAxisSpacing: 8,
                                          ),
                                          itemBuilder: (context, index) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.black12)),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    width: 20,
                                                    '${_controller.mostUsed[index]['icon']}',
                                                    fit: BoxFit.fill,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(_controller
                                                      .mostUsed[index]['name']
                                                      .toString()),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      }),
                                      SizedBox(height: 16.0),
                                      // Other Categories
                                      Text('Other categories',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(height: 8.0),

                                      Expanded(
                                          child: ListView.builder(
                                        itemCount:
                                            _controller.otherCategories.length,
                                        itemBuilder: (context, index) {
                                          return Obx(
                                            () => Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.black12),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: ListTile(
                                                leading: SvgPicture.asset(
                                                    '${_controller.otherCategories[index]['icon']}'),
                                                title: Text(_controller
                                                    .otherCategories[index]
                                                        ['name']
                                                    .toString()),
                                                trailing: Container(
                                                  height: 20,
                                                  width: 20,
                                                  child: controller
                                                              .selectedIndex
                                                              .value ==
                                                          index
                                                      ? Container(
                                                          width: 13,
                                                          height: 13,
                                                          decoration:
                                                              BoxDecoration(
                                                                  shape:
                                                                      BoxShape
                                                                          .circle,
                                                                  color: Colors
                                                                      .blue))
                                                      : null,
                                                  padding: EdgeInsets.all(2),
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        width: 1,
                                                        color: Color(0xff115DB1),
                                                      )),
                                                ),
                                                onTap: () => controller
                                                    .selectedIndex
                                                    .value = index,
                                              ),
                                            ),
                                          );
                                        },
                                      ))
                                    ],
                                  ),
                                ),
                              ),
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Category"),
                              Icon(size: 15, Icons.keyboard_arrow_down)
                            ],
                          ),
                        )),
                    Container(
                        decoration: BoxDecoration(
                            color: Color(0xffE6E6E6),
                            borderRadius: BorderRadius.circular(30)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Price"),
                            Icon(size: 15, Icons.keyboard_arrow_down)
                          ],
                        )),
                    Container(
                        decoration: BoxDecoration(
                            color: Color(0xffE6E6E6),
                            borderRadius: BorderRadius.circular(30)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                                color: Colors.black,
                                height: 10,
                                width: 10,
                                "assets/svg/filter.svg"),
                            Text("Category"),
                            Icon(size: 15, Icons.keyboard_arrow_down)
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ),
          Expanded(child: ElectronicsGrid()),
        ],
      ),
    );
  }
}

class ElectronicsGrid extends StatelessWidget {
  Api _api = Api();
  HomeController controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return gridCard(controller.products.value.data);
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
  //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //             crossAxisCount: 2,
  //             crossAxisSpacing: 15,
  //             mainAxisSpacing: 2,
  //             childAspectRatio: 0.75,
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
  //                                 onTap: isliked.isFalse
  //                                     ? () async {
  //                                         isliked.value = !isliked.value;
  //                                         await _api.Addtowishlist(
  //                                             product[index].id);
  //                                       }
  //                                     : () async {
  //                                         isliked.value = !isliked.value;
  //                                         await _api.Removetowishlist(
  //                                             product[index].id);
  //                                       },
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
