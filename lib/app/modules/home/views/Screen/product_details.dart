import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:pazimo/app/data/productDetails.dart';
import 'package:pazimo/app/modules/home/controllers/home_controller.dart';
import 'package:pazimo/app/modules/home/views/Screen/checkout.dart';
import '../../../../../api/Api_Methods/allmethodsapi.dart';
import '../../../Components/Expantion_button.dart';
import '../../../Components/icon_button.dart';
import '../../../Components/short_button.dart';

// ignore: must_be_immutable
class ProductDetailView extends StatelessWidget {
  ProductDetailView({super.key, required this.id});
  int id;
  Api _api = Api();
  RxBool isloading = false.obs;
  var product = Product(
    id: 0,
    sku: '',
    type: '',
    name: '',
    urlKey: '',
    price: '',
    formattedPrice: '',
    shortDescription: '',
    description: '',
    images: [],
    videos: [],
    baseImage: {},
    reviews: {},
    inStock: false,
    isSaved: false,
    isNew: false,
    isFeatured: false,
    isBigsale: false,
    isItemInCart: false,
    showQuantityChanger: false,
    downloadableLinks: [],
    downloadableSamples: [],
  ).obs;
  RxDouble totalPrice = 0.0.obs;
  Future<void> details() async {
    isloading.value = true;
    var response = await _api.productDetails(1);
    if (response.statusCode == 200) {
      var responseData = response.data;
      var productData = Product.fromJson(responseData['data']);
      product(productData);
      price.value = double.parse(product.value.price);
      if (price.value > 0.0) {
        isloading.value = false;
      }
    }

    // isloading.value = false;
  }

  RxInt itemNumber = 1.obs;
  RxDouble price = 0.0.obs;

  RxBool isAdded = false.obs;
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    details();

    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 80,
        centerTitle: true,
        title: Text(
          "Product details",
          style: GoogleFonts.poppins(
              fontSize: 24, fontWeight: FontWeight.w400, color: Colors.blue),
        ),
      ),
      body: Obx(
        () => isloading.value == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Obx(
                () => Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil().setWidth(16)),
                          child: ListView(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 400.h,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE6E6E6),
                                      borderRadius: BorderRadius.circular(
                                          ScreenUtil().setWidth(10)),
                                    ),
                                    child: Center(
                                        child: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: product.value.images?.length == 0
                                          ? CachedNetworkImage(
                                              imageUrl:
                                                  'https://m.media-amazon.com/images/I/51hJIsWMagL._AC_UF1000,1000_QL80_.jpg',
                                            )
                                          : PageView.builder(
                                              itemCount:
                                                  product.value.images?.length,
                                              itemBuilder: (context, index) {
                                                return Container();
                                              }),
                                    )),
                                  ),
                                  Positioned(
                                      child: Container(
                                    color: Colors.red,
                                    child: Text(
                                      "New",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )),
                                  // Positioned(
                                  //     top: 12.h,
                                  //     right: 12.w,
                                  //     child: InkWell(
                                  //       radius: 20.sp,
                                  //       onTap: _isliked.value
                                  //           ? () async {
                                  //               try {
                                  //                 _isliked.value = false;
                                  //                 final response = await dio.delete(
                                  //                   "${ApiConfig.wishlists}/${result.id}",
                                  //                   options: Options(
                                  //                     headers: ApiConfig.getHeaders(
                                  //                       '5|Un9WMgXaFpufTzyV5UQbzbeRQd2ICUpU3E5IkShO6b87533f',
                                  //                     ),
                                  //                   ),
                                  //                 );
                                  //                 if (response.statusCode == 200) {
                                  //                   controller.wishlist.value =
                                  //                       await api.feachWhishlist();

                                  //                   print(response.data);
                                  //                 } else {
                                  //                   print(
                                  //                       'Failed with status code: ${response.statusCode}');
                                  //                 }
                                  //               } on DioException catch (e) {
                                  //                 if (e.response != null) {
                                  //                   print(
                                  //                       'DioException: ${e.response?.statusCode} - ${e.response?.data}');
                                  //                 } else {
                                  //                   print('DioException: ${e.message}');
                                  //                 }
                                  //               } catch (e) {
                                  //                 print('Error: $e');
                                  //               }
                                  //             }
                                  //           : () async {
                                  //               _isliked.value = true;
                                  //               try {
                                  //                 final response = await dio.post(
                                  //                   "${ApiConfig.wishlists}",
                                  //                   data: {
                                  //                     "product_id": product.id,
                                  //                   },
                                  //                   options: Options(
                                  //                     headers: ApiConfig.getHeaders(
                                  //                       '5|Un9WMgXaFpufTzyV5UQbzbeRQd2ICUpU3E5IkShO6b87533f',
                                  //                     ),
                                  //                   ),
                                  //                 );

                                  //                 if (response.statusCode == 201) {
                                  //                   controller.wishlist.value =
                                  //                       await api.feachWhishlist();
                                  //                   print(controller.wishlist.length);
                                  //                   print("like ${_isliked.value}");
                                  //                   // return response;
                                  //                 } else {
                                  //                   throw Exception(
                                  //                       'Failed to add to wishlist: Unexpected status code ${response.statusCode}');
                                  //                 }
                                  //               } on DioException catch (e) {
                                  //                 // Handle Dio specific errors
                                  //                 if (e.response != null) {
                                  //                   print(
                                  //                       'DioError: ${e.response?.statusCode} - ${e.response?.data}');
                                  //                 } else {
                                  //                   print('DioError: ${e.message}');
                                  //                 }

                                  //                 throw Exception(
                                  //                     'Failed to add to wishlist: DioError - ${e.message}');
                                  //               } catch (e) {
                                  //                 // Handle other types of exceptions
                                  //                 print('Unexpected error: $e');
                                  //                 throw Exception(
                                  //                     'Failed to add to wishlist: Unexpected error $e');
                                  //               }
                                  //             },
                                  //       child: Container(
                                  //         width: 37.h,
                                  //         height: 37.h,
                                  //         decoration: BoxDecoration(
                                  //             color: Colors.white,
                                  //             borderRadius: BorderRadius.circular(5)),
                                  //         child: Center(
                                  //           child: _isliked.value
                                  //               ? SvgPicture.asset(
                                  //                   "assets/svg/liked.svg")
                                  //               : SvgPicture.asset(
                                  //                   "assets/svg/like.svg"),
                                  //         ),
                                  //       ),
                                  //     )),

                                  Positioned(
                                      bottom: 12.h,
                                      left: 0,
                                      right: 0,
                                      child:
                                          Center(child: Text("select color")))
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Apple'.toString(),
                                    style: GoogleFonts.poppins(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xFFB3B3B3)),
                                  ),
                                  Row(
                                    children: [
                                      RatingBar.builder(
                                        itemSize: 18.sp,
                                        initialRating: 5,
                                        minRating: 0,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 4,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber.withOpacity(0.5),
                                        ),
                                        onRatingUpdate: (double value) {},
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "4.7",
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${product.value.name}",
                                    style: GoogleFonts.poppins(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 20.h,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Storage",
                                    style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),

                                  // ? Container(
                                  //     height: 40.h, // Provide a fixed height
                                  //     child: ListView.builder(
                                  //       itemCount: controller
                                  //           .products[productIndex.value]
                                  //           .sizes
                                  //           .length,
                                  //       scrollDirection: Axis.horizontal,
                                  //       itemBuilder: (context, index) {
                                  //         return Padding(
                                  //           padding:
                                  //               const EdgeInsets.only(right: 8.0),
                                  //           child: Obx(
                                  //             () => SelectedBox(
                                  //                 controller
                                  //                     .products[productIndex.value]
                                  //                     .sizes[index],
                                  //                 selectedIndex.value == index
                                  //                     ? Color(0XFFD9D9D9)
                                  //                     : Color(0XFF999999),
                                  //                 selectedIndex.value == index
                                  //                     ? Colors.black
                                  //                     : Colors.white,
                                  //                 index,
                                  //                 selectedIndex),
                                  //           ),
                                  //         );
                                  //       },
                                  //     ))
                                  // : Container(),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Text(
                                    "Color",
                                    style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  // product.value.color is List
                                  //     ? Container(
                                  //         height: 40.h,
                                  //         child: ListView.builder(
                                  //             scrollDirection: Axis.horizontal,
                                  //             itemCount: product.color.length,
                                  //             itemBuilder: (context, index) {
                                  //               return Obx(
                                  //                 () => Padding(
                                  //                   padding: const EdgeInsets.only(
                                  //                       right: 8.0),
                                  //                   child: SelectedBox(
                                  //                       product.color[index],
                                  //                       selectedColorIndex.value ==
                                  //                               index
                                  //                           ? Color(0XFFD9D9D9)
                                  //                           : Color(0XFF999999),
                                  //                       selectedColorIndex.value ==
                                  //                               index
                                  //                           ? Colors.black
                                  //                           : Colors.white,
                                  //                       index,
                                  //                       selectedColorIndex),
                                  //                 ),
                                  //               );
                                  //             }),
                                  //       )
                                  //     : Text(product.color)
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(product.value.shortDescription,
                                  style: Theme.of(context).textTheme.bodyLarge),
                              SizedBox(
                                height: 10,
                              ),
                              ExpansionButton(
                                title: 'Product Details',
                                description:
                                    product.value.description.toString(),
                              ),

                              // SizedBox(
                              //   height: 10,
                              // ),
                              // ExpansionButton(
                              //   title: 'Specifications',
                              //   description:
                              //       product.
                              //       .toString(),
                              // ),
                              SizedBox(
                                height: 10,
                              ),
                              // ExpansionButton(
                              //   title: 'Material & Care',
                              //   description: controller
                              //       .products[productIndex.value].materialAndCare
                              //       .toString(),
                              // ),
                              SizedBox(
                                height: 10,
                              ),
                              // ExpansionButton(
                              //   title: 'Rating & Reviews',
                              //   onTap: () {
                              //     Get.to(() => ReviewsPage());
                              //   },
                              //   buttonName: "See More",
                              //   totalReview: "10 reviews",
                              //   rating: RatingBar.builder(
                              //     itemSize: 18.sp,
                              //     initialRating: 3,
                              //     minRating: 1,
                              //     direction: Axis.horizontal,
                              //     allowHalfRating: true,
                              //     itemCount: 5,
                              //     itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                              //     itemBuilder: (context, _) => Icon(
                              //       Icons.star,
                              //       color: Colors.amber.withOpacity(0.9),
                              //     ),
                              //     onRatingUpdate: (double value) {},
                              //   ),
                              //   description: product.reviews[0].comment.toString(),
                              //   name: product.reviews[0].user.toString(),
                              //   dateofrating: "0/12/1202".toString(),
                              // ),
                              SizedBox(
                                height: 90.h,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: ScreenUtil().setWidth(16)),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(2, 2),
                                spreadRadius: 2,
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5))),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Iconbutton(
                                        onTap: () {
                                          if (itemNumber.value > 1) {
                                            itemNumber.value =
                                                itemNumber.value - 1;
                                            totalPrice.value =
                                                controller.priceCalculation(
                                                    itemNumber, price);
                                          } else {
                                            itemNumber.value = 1;
                                            totalPrice.value =
                                                controller.priceCalculation(
                                                    itemNumber, price);
                                          }
                                        },
                                        icon: Icons.remove,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "${itemNumber}",
                                        style: GoogleFonts.poppins(
                                          fontSize: 20,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Iconbutton(
                                        onTap: () {
                                          itemNumber.value =
                                              itemNumber.value + 1;
                                          totalPrice.value =
                                              controller.priceCalculation(
                                                  itemNumber, price);
                                        },
                                        icon: Icons.add,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'ETB \$${NumberFormat.decimalPattern().format(totalPrice.value)}',
                                    style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ShortButton(
                                    title: "Buy Now",
                                    onTap: () {
                                      Get.to(() => CheckoutView());
                                    },
                                    color: Colors.amber),
                                Obx(
                                  () => ShortButton(
                                    title: isAdded.value == false
                                        ? "Add to cart"
                                        : "Remove from cart",
                                    //       onTap: isAdded.value == false
                                    //           ? () {
                                    //               isAdded.value = true;
                                    //               detailsToAdd = {
                                    //                 "id": product.id,
                                    //                 "name": product.name,
                                    //                 'price': (product.price).obs,
                                    //                 'image': product
                                    //                             .images.length ==
                                    //                         0
                                    //                     ? "https://via.placeholder.com/150"
                                    //                     : product.images[0],
                                    //                 "itemNumber": itemNumber,
                                    //                 "total_price": totalPrice,
                                    //                 "color": product.color is List
                                    //                     ? product.color[
                                    //                         selectedColorIndex]
                                    //                     : product.color,
                                    //                 "size": ""
                                    //               };

                                    //               controller
                                    //                   .addtoCart(detailsToAdd);
                                    //               Get.snackbar(
                                    //                   colorText: Colors.white,
                                    //                   backgroundColor: Colors.green,
                                    //                   "successfully",
                                    //                   "added to cart");
                                    //             }
                                    //           : () => {
                                    //                 isAdded.value = false,
                                    //                 controller.removeFromCart(
                                    //                     detailsToAdd),
                                    //               },
                                    color: Colors.blue, onTap: () {},
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget SelectedBox(
    String title,
    Color bgcolor,
    Color txtcolor,
    int index,
    RxInt selectedIndex,
  ) {
    return InkWell(
      onTap: () {
        selectedIndex.value = index;
      },
      child: Container(
        width: 50.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.poppins(
              color: txtcolor,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
//  // Container(
//               //   height: 132.h,
//               //   width: MediaQuery.of(context).size.width,
//               //   decoration: BoxDecoration(
//               //     color: Colors.white,
//               //     boxShadow: [
//               //       BoxShadow(
//               //         color: Colors.black.withOpacity(0.5),
//               //         spreadRadius: 0,
//               //         blurRadius: 4,
//               //         offset: Offset(0,
//               //             2), // This controls the vertical offset (top shadow)
//               //       ),
//               //     ],
//               //   ),
//               //   child: Padding(
//               //     padding: EdgeInsets.symmetric(
//               //         horizontal: ScreenUtil().setWidth(16)),
//               //     child: Column(
//               //       mainAxisAlignment: MainAxisAlignment.center,
//               //       children: [
//               //         Row(
//               //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //           children: [
//               //             Container(
//               //               width: 90.w,
//               //               child: Row(
//               //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //                 children: [
//               //                   Iconbutton(
//               //                     onTap: () {
//               //                       if (itemNumber.value > 1) {
//               //                         itemNumber.value = itemNumber.value - 1;
//               //                       } else {
//               //                         itemNumber.value = 1;
//               //                       }
//               //                     },
//               //                     icon: Icons.remove,
//               //                   ),
//               //                   Text(
//               //                     "${itemNumber}",
//               //                     style:
//               //                         Theme.of(context).textTheme.titleMedium,
//               //                   ),
//               //                   Iconbutton(
//               //                     onTap: () {
//               //                       itemNumber.value = itemNumber.value + 1;
//               //                     },
//               //                     icon: Icons.add,
//               //                   ),
//               //                 ],
//               //               ),
//               //             ),
//               //             Text(
//               //               "Total:ETB ${controller.priceCalculation(itemNumber, price_of_item)}",
//               //               style: Theme.of(context).textTheme.titleMedium,
//               //             ),
//               //           ],
//               //         ),
//               //         SizedBox(
//               //           height: 15.h,
//               //         ),

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     ShortButton(
//         title: "Buy Now",
//         onTap: () {},
//         color: Colors.amber),
//     Obx(
//       () => ShortButton(
//           title: isAdded.value == false
//               ? "Add to cart"
//               : "Remove from cart",
//           onTap: isAdded.value == false
//               ? () {
//                   isAdded.value = true;
//                   detailsToAdd = {
//                     "id": controller
//                         .products[productIndex.value].id,
//                     'total_price':
//                         controller.priceCalculation(
//                             itemNumber, price_of_item),
//                     'single_price': price_of_item,
//                     'quantity': itemNumber,
//                     'image': controller
//                         .products[productIndex.value]
//                         .photos[0],
//                     'color': controller
//                         .products[productIndex.value]
//                         .colors[colorIndex.value],
//                     'size': controller
//                         .products[productIndex.value]
//                         .sizes[selectedIndex.value],
//                   };

//                   controller.addtoCart(detailsToAdd);
//                   Get.snackbar(
//                       colorText: Colors.white,
//                       backgroundColor: Colors.green,
//                       "successfully",
//                       "added to cart");
//                 }
//               : () => {
//                     isAdded.value = false,
//                     controller
//                         .removeFromCart(detailsToAdd),
//                   },
//           color: Colors.blue),
//     ),
//   ],
// )
