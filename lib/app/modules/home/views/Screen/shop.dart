// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:pazimo/app/modules/home/controllers/home_controller.dart';
// import 'package:shimmer/shimmer.dart';

// import '../../../../../api/Api_Methods/allmethodsapi.dart';
// import '../../../../Shimmer/gridproductCardShimmer.dart';
// import '../../../Components/product_card.dart';

// class Shop extends StatelessWidget {
//   Shop({super.key});
//   final controller = Get.find<HomeController>();

//   @override
//   Widget build(BuildContext context) {
//     var categories = ["All", "AirPods", "Cerave", "Laptops", "Clothes"];
//     var selectedCatigories = 'All'.obs;
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Column(
//               children: [
//                 SizedBox(height: 10),
//                 Text("Shop"),
//                 SizedBox(height: 10),
//                 SearchBar(),
//                 SizedBox(height: 15),
//                 Container(
//                   width: double.infinity,
//                   height: 120.h,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                       image: DecorationImage(
//                           fit: BoxFit.fill,
//                           image: AssetImage("assets/images/banner.png"))),
//                 ),
//                 SizedBox(height: 15),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Categories",
//                       style: GoogleFonts.poppins(
//                           fontSize: 16, fontWeight: FontWeight.w600),
//                     ),
//                     Text(
//                       "See all",
//                       style:
//                           GoogleFonts.poppins(fontSize: 16, color: Colors.blue),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 Container(
//                   height: 30,
//                   child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: categories.length,
//                       itemBuilder: ((context, index) {
//                         return Container(
//                           margin: EdgeInsets.only(right: 15),
//                           child: InkWell(
//                             onTap: () {
//                               selectedCatigories.value = categories[index];
//                             },
//                             child: Obx(
//                               () => Container(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 15, vertical: 6),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10),
//                                     border: Border.all(
//                                         width: 1,
//                                         color: selectedCatigories.value ==
//                                                 categories[index]
//                                             ? Colors.transparent
//                                             : Colors.black),
//                                     color: selectedCatigories.value ==
//                                             categories[index]
//                                         ? const Color.fromARGB(255, 0, 0, 0)
//                                         : Colors.white,
//                                   ),
//                                   child: Text(
//                                     categories[index],
//                                     style: TextStyle(
//                                         color: selectedCatigories.value ==
//                                                 categories[index]
//                                             ? Colors.white
//                                             : Colors.black),
//                                   )),
//                             ),
//                           ),
//                         );
//                       })),
//                 ),
//                 SizedBox(height: 10),
//                 Obx(() {
//                   if (controller.isLoading.value) {
//                     return gridproductCardShimmer();
//                   } else {
//                     return Container(
//                       width: double.infinity,
//                       height: 1000,
//                       child: Center(
//                         child: GridView.builder(
//                           shrinkWrap: true,
//                           physics: NeverScrollableScrollPhysics(),
//                           padding: const EdgeInsets.all(10.0),
//                           gridDelegate:
//                               SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             crossAxisSpacing: 40,
//                             mainAxisSpacing: 2,
//                             childAspectRatio: 0.65,
//                           ),
//                           itemCount: controller.products.value.data.length,
//                           itemBuilder: (ctx, index) => ProductCard(
//                             ImageSource:
//                                 "https://img.freepik.com/free-psd/isolated-black-t-shirt-opened_125540-1283.jpg?w=740&t=st=1717745109~exp=1717745709~hmac=507d1b2ce4e5d6698346b62632771a272d9bff49db8b26f51840ba0e65bad847",
//                             description: controller
//                                 .products.value.data[index].shortDescription,
//                             price: 'ETB \$' +
//                                 NumberFormat.decimalPattern().format(controller
//                                     .products.value.data[index].price),
//                             oldprice:
//                                 NumberFormat.decimalPattern().format(8000),
//                             tap: () async {
//                               // await Api().fetchProductDetail(
//                               //     controller.products[index].id);
//                             },
//                             id: "${controller.products.value.data[index].id}",
//                             isLiked: true,
//                           ),
//                         ),
//                       ),
//                     );
//                   }
//                 })
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SearchBar extends StatelessWidget {
//   const SearchBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           border: Border.all(width: 1, color: Colors.black),
//           borderRadius: BorderRadius.circular(40)),
//       child: Row(
//         children: [
//           Padding(
//             padding: EdgeInsets.only(left: 16),
//             child: Image.asset("assets/images/logo.png"),
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 10),
//             child: Text(
//               "|",
//               style: TextStyle(fontSize: 20),
//             ),
//           ),
//           Expanded(
//               child: TextField(
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.only(top: 4, bottom: 4, left: 10),
//               hintText: 'Search...',
//               border: InputBorder.none,
//             ),
//           )),
//           Container(
//             margin: EdgeInsets.only(right: 10),
//             decoration: BoxDecoration(
//                 color: Colors.blue, borderRadius: BorderRadius.circular(30)),
//             padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
//             child: SvgPicture.asset(
//               "assets/svg/search.svg",
//               color: Colors.white,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// // Widget buildShimmerList() {
// //   return ;
// // }


// // Container(
// //           width: double.infinity,
// //           child: Column(
// //             children: [
// //               Image.network(
// //                   "https://p7.hiclipart.com/preview/364/581/66/airpods-apple-earbuds-headphones-iphone-apple.jpg"),
// //               Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Text('iPhone 14 Pro 128 GB'),
// //                   Row(
// //                     children: [
// //                       Text('ETB 78,000'),
// //                       SizedBox(
// //                         width: 20,
// //                       ),
// //                       Text('79,000'),
// //                     ],
// //                   )
// //                 ],
// //               )
// //             ],
// //           ),
// //         );

// //  Shimmer.fromColors(
// //           baseColor: Colors.grey[300]!,
// //           highlightColor: Colors.grey[100]!,
// //           child: Card(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Container(
// //                   height: 120.0,
// //                   color: Colors.white,
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.all(8.0),
// //                   child: Container(
// //                     height: 20.0,
// //                     width: double.infinity,
// //                     color: Colors.white,
// //                   ),
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
// //                   child: Container(
// //                     height: 20.0,
// //                     width: 100.0,
// //                     color: Colors.white,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );