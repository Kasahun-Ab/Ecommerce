// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:pazimo/api/Api_Methods/allmethodsapi.dart';
// import 'package:pazimo/app/modules/home/controllers/home_controller.dart';

// import '../../../../../api/ApiConfig.dart';
// import '../../../../data/productModel.dart';
// import '../../../../data/whishlist.dart';
// // import 'product_details.dart';

// // ignore: must_be_immutable
// class SavedItemsPage extends StatelessWidget {
//   Dio dio = Dio(BaseOptions(baseUrl: ApiConfig.baseUrl));
//   Api api = Api();
//   final HomeController controller = Get.find<HomeController>();
//   RxList<Product> search(
//       RxList<Product> products, List<whishlistmodel> wishlist) {
//     List<String> wishlistIds = wishlist.map((item) => item.productId).toList();
//     RxList<Product> result = products
//         .where((element) => wishlistIds.contains(element.id))
//         .toList()
//         .obs;
//     return result;
//   }

//   @override
//   Widget build(BuildContext context) {
//     RxList<Product> wishlistproduct =
//         search(controller.products, controller.wishlist);

//     return Scaffold(
//         appBar: AppBar(
//           toolbarHeight: 80,
//           title: Text('Saved Items'),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.notifications),
//               onPressed: () {},
//             ),
//           ],
//         ),
//         body: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Obx(
//               () => wishlistproduct.length == 0
//                   ? Center(
//                       child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SvgPicture.asset("assets/svg/large_love.svg"),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           "No Saved Items!",
//                           style: GoogleFonts.poppins(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.blue),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           "You don’t have any saved \nitems. Go to home and add\n some",
//                           style: GoogleFonts.poppins(
//                               fontSize: 15,
//                               fontWeight: FontWeight.w500,
//                               color: Color(0xff808080)),
//                         ),
//                       ],
//                     ))
//                   : GridView.builder(
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         crossAxisSpacing: 32.0,
//                         mainAxisSpacing: 16.0,
//                         childAspectRatio: 0.73,
//                       ),
//                       itemCount: wishlistproduct.length,
//                       itemBuilder: (context, index) {
//                         return InkWell(
//                           onTap: () async {
//                             // await Api()
//                             //     .fetchProductDetail(wishlistproduct[index].id);
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10)),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Expanded(
//                                   child: ClipRRect(
//                                       borderRadius: BorderRadius.vertical(
//                                         top: Radius.circular(10),
//                                         bottom: Radius.circular(10),
//                                       ),
//                                       child: Container(
//                                         height: 290,
//                                         color:
//                                             Color.fromARGB(195, 105, 105, 105),
//                                         child: Stack(
//                                           children: [
//                                             Image.network(
//                                                 width: 270,
//                                                 fit: BoxFit.cover,
//                                                 "https://p7.hiclipart.com/preview/364/581/66/airpods-apple-earbuds-headphones-iphone-apple.jpg"),
//                                             Positioned(
//                                                 top: 12.h,
//                                                 right: 12.w,
//                                                 child: InkWell(
//                                                   radius: 20.sp,
//                                                   onTap: () async {
//                                                     try {
//                                                       final response =
//                                                           await dio.delete(
//                                                         "${ApiConfig.wishlists}/${id(wishlistproduct[index].id)}",
//                                                         options: Options(
//                                                           headers: ApiConfig
//                                                               .getHeaders(
//                                                                   controller
//                                                                       .userData
//                                                                       .token),
//                                                         ),
//                                                       );
//                                                       if (response.statusCode ==
//                                                           200) {
//                                                         controller.wishlist
//                                                                 .value =
//                                                             await api
//                                                                 .feachWhishlist();
//                                                         wishlistproduct
//                                                             .removeWhere(
//                                                           (element) =>
//                                                               element.id ==
//                                                               wishlistproduct[
//                                                                       index]
//                                                                   .id,
//                                                         );
//                                                         print(response.data);
//                                                       } else {
//                                                         print(
//                                                             'Failed with status code: ${response.statusCode}');
//                                                       }
//                                                     } on DioException catch (e) {
//                                                       if (e.response != null) {
//                                                         print(
//                                                             'DioException: ${e.response?.statusCode} - ${e.response?.data}');
//                                                       } else {
//                                                         print(
//                                                             'DioException: ${e.message}');
//                                                       }
//                                                     } catch (e) {
//                                                       print('Error: $e');
//                                                     }
//                                                   },
//                                                   child: Container(
//                                                     width: 37.h,
//                                                     height: 37.h,
//                                                     decoration: BoxDecoration(
//                                                         color: Colors.white,
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(5)),
//                                                     child: Center(
//                                                       child: SvgPicture.asset(
//                                                           "assets/svg/liked.svg"),
//                                                     ),
//                                                   ),
//                                                 )),
//                                           ],
//                                         ),
//                                       )),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         wishlistproduct[index].name,
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 14,
//                                           color: Colors.grey[600],
//                                         ),
//                                       ),
//                                       SizedBox(height: 4),
//                                       Row(
//                                         children: [
//                                           Text(
//                                             'ETB \$${NumberFormat.decimalPattern().format(int.parse(wishlistproduct[index].price))}',
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 16,
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             width: 30,
//                                           ),
//                                           Text(
//                                             '${NumberFormat.decimalPattern().format(8000)}',
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.grey,
//                                               decoration:
//                                                   TextDecoration.lineThrough,
//                                               fontSize: 13,
//                                             ),
//                                           ),
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//             )));
//   }

//   id(String productId) {
//     for (var item in controller.wishlist) {
//       if (item.productId == productId) {
//         return item.id;
//       }
//     }
//     return null;
//   }
// }
