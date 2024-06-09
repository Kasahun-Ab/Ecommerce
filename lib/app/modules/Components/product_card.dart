// // ignore_for_file: must_be_immutable

// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pazimo/api/Api_Methods/allmethodsapi.dart';
// import 'package:pazimo/app/data/whishlist.dart';
// import 'package:pazimo/app/modules/home/controllers/home_controller.dart';

// import '../../../api/ApiConfig.dart';

// class ProductCard extends StatelessWidget {
//   ProductCard(
//       {super.key,
//       required this.ImageSource,
//       required this.description,
//       required this.price,
//       required this.isLiked,
//       this.oldprice = '',
//       required this.tap,
//       required this.id
      
//       });
//   String id;
//   String ImageSource;
// bool isLiked;
//   String description;
//   String price;
//   String oldprice;

//   // RxBool isLiked = false.obs;
//   final Function() tap;
//   final HomeController controller = Get.find<HomeController>();

//   final dio = Dio(BaseOptions(
//     baseUrl: ApiConfig.baseUrl,
//   ));
//   Api api = Api();
 
//   @override
//   Widget build(BuildContext context) {
//      RxBool _isliked = isLiked.obs;
//     whishlistmodel result = whishlistmodel(id: '', userId: '', productId: '');
//     try {
//       result = controller.wishlist.firstWhere((model) => model.productId == id);
//     } catch (e) {}
//     if (result.productId == id) {
//       _isliked.value = true;
//     }

//     return InkWell(
//       onTap: tap,
//       child: Obx(
//         () => Container(
//           // width: 165.w,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Stack(
//                 children: [
//                   Container(
//                     height: 190.h,
//                     width: 161.h,
//                     decoration: BoxDecoration(
//                         color: Color(0xFFE6E6E6),
//                         borderRadius: BorderRadius.circular(10),
//                         image: DecorationImage(
//                             image: NetworkImage(ImageSource),
//                             fit: BoxFit.scaleDown)),
//                   ),
//                   Positioned(
//                       top: 12.h,
//                       right: 12.w,
//                       child: InkWell(
//                         radius: 20.sp,
//                         onTap: _isliked.value
//                             ? () async {
//                                 try {
//                                   _isliked.value = false;
//                                   final response = await dio.delete(
//                                       "${ApiConfig.wishlists}/${result.id}",
//                                       options: Options(
//                                           headers: ApiConfig.getHeaders(
//                                               controller.userData.token)));
//                                   if (response.statusCode == 200) {
//                                     controller.wishlist.value =
//                                         await api.feachWhishlist();

//                                     print(response.data);
//                                   } else {
//                                     print(
//                                         'Failed with status code: ${response.statusCode}');
//                                   }
//                                 } on DioException catch (e) {
//                                   if (e.response != null) {
//                                     print(
//                                         'DioException: ${e.response?.statusCode} - ${e.response?.data}');
//                                   } else {
//                                     print('DioException: ${e.message}');
//                                   }
//                                 } catch (e) {
//                                   print('Error: $e');
//                                 }
//                               }
//                             : () async {
//                                 _isliked.value = true;
//                                 try {
//                                   final response = await dio.post(
//                                       "${ApiConfig.wishlists}",
//                                       data: {
//                                         "product_id": id,
//                                       },
//                                       options: Options(
//                                           headers: ApiConfig.getHeaders(
//                                               controller.userData.token)));

//                                   if (response.statusCode == 201) {
//                                     controller.wishlist.value =
//                                         await api.feachWhishlist();
//                                     print(controller.wishlist.length);
//                                     print("like ${_isliked.value}");
//                                     // return response;
//                                   } else {
//                                     throw Exception(
//                                         'Failed to add to wishlist: Unexpected status code ${response.statusCode}');
//                                   }
//                                 } on DioException catch (e) {
//                                   // Handle Dio specific errors
//                                   if (e.response != null) {
//                                     print(
//                                         'DioError: ${e.response?.statusCode} - ${e.response?.data}');
//                                   } else {
//                                     print('DioError: ${e.message}');
//                                   }

//                                   throw Exception(
//                                       'Failed to add to wishlist: DioError - ${e.message}');
//                                 } catch (e) {
//                                   // Handle other types of exceptions
//                                   print('Unexpected error: $e');
//                                   throw Exception(
//                                       'Failed to add to wishlist: Unexpected error $e');
//                                 }
//                               },
//                         child: Container(
//                           width: 37.h,
//                           height: 37.h,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(5)),
//                           child: Center(
//                             child: _isliked.isTrue
//                                 ? SvgPicture.asset("assets/svg/liked.svg")
//                                 : SvgPicture.asset("assets/svg/like.svg"),
//                           ),
//                         ),
//                       )),
//                 ],
//               ),
//               SizedBox(
//                 height: 5.h,
//               ),
//               Container(
//                 width: 161,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       description.toUpperCase(),
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 1,
//                       style: GoogleFonts.poppins(
//                           fontSize: 13.sp,
//                           fontWeight: FontWeight.normal,
//                           color: Color(0xFF999999)),
//                     ),
//                     Row(
//                       children: [
//                         Text(price,
//                             style: GoogleFonts.poppins(
//                               color: Color(0xFF4D4D4D),
//                               fontSize: 14.sp,
//                               fontWeight: FontWeight.bold,
//                             )),
//                         SizedBox(
//                           width: 10.w,
//                         ),
//                         Text(
//                           oldprice,
//                           style: GoogleFonts.poppins(
//                             color: Color(0xFFB3B3B3),
//                             fontSize: 11.sp,
//                             fontWeight: FontWeight.bold,
//                             decoration: TextDecoration.lineThrough,
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
