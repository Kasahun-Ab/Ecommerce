import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/modules/Components/Expantion_button.dart';
import 'package:pazimo/app/modules/Components/short_button.dart';
import 'package:pazimo/app/modules/home/controllers/home_controller.dart';
import 'package:pazimo/app/modules/home/views/Screen/review.dart';
import '../../../Components/icon_button.dart';

// ignore: must_be_immutable
class ProductDetailView extends StatelessWidget {
  ProductDetailView({super.key, required this.productIndex});
  final RxInt productIndex;
  RxInt itemNumber = 1.obs;
  RxBool isAdded = false.obs;

  RxInt selectedIndex = 0.obs;
  RxInt selectedColorIndex = 0.obs;
  RxDouble price_of_item = 0.0.obs;
  Map<String, dynamic> detailsToAdd = {};
  RxInt colorIndex = 0.obs;

  final HomeController controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    RxBool isLiked = true.obs;
    price_of_item.value = controller.products[productIndex.value].price;

    var index = controller.products[productIndex.value].id;
    if (controller.liked.contains(index)) {
      isLiked.value = true;
    } else {
      isLiked.value = false;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Product details",
          style: GoogleFonts.poppins(
              fontSize: 24, fontWeight: FontWeight.w400, color: Colors.blue),
        ),
      ),
      body: Obx(
        () => Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                              child: PageView.builder(
                                  itemCount: controller
                                      .products[productIndex.value]
                                      .photos
                                      .length,
                                  itemBuilder: (context, index) {
                                    return Image.asset(
                                      "${controller.products[productIndex.value].photos[index]}",
                                    );
                                  }),
                            )),
                          ),
                          Positioned(
                              top: 12.h,
                              right: 12.w,
                              child: InkWell(
                                radius: 20.sp,
                                onTap: () {
                                  if (isLiked.value) {
                                    controller.liked
                                        .remove(productIndex.value - 1);
                                    // controller.removeStorage(
                                    //     controller.products[index]);
                                    isLiked.value = false;
                                  } else {
                                    // controller
                                    //     .addStorage(controller.products[index]);
                                    isLiked.value = true;
                                  }
                                },
                                child: Container(
                                  width: 37.h,
                                  height: 37.h,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: isLiked.value
                                        ? SvgPicture.asset(
                                            "assets/svg/liked.svg")
                                        : SvgPicture.asset(
                                            "assets/svg/like.svg"),
                                  ),
                                ),
                              )),
                          Positioned(
                              bottom: 12.h,
                              left: 0,
                              right: 0,
                              child: Center(child: Text("select color")))
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.products[productIndex.value].brand
                                .toString(),
                            style: GoogleFonts.poppins(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w300,
                                color: Color(0xFFB3B3B3)),
                          ),
                          RatingBar.builder(
                            itemSize: 18.sp,
                            initialRating: controller
                                .products[productIndex.value]
                                .reviews[0]["rating"]
                                .toDouble(),
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber.withOpacity(0.5),
                            ),
                            onRatingUpdate: (double value) {},
                          )
                        ],
                      ),
                      Text(
                        "Iphone 15 pro max",
                        style: GoogleFonts.poppins(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                        ),
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
                                fontSize: 14.sp, fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          controller.products[productIndex.value].sizes.length >
                                  0
                              ? Container(
                                  height: 40.h, // Provide a fixed height
                                  child: ListView.builder(
                                    itemCount: controller
                                        .products[productIndex.value]
                                        .sizes
                                        .length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Obx(
                                          () => SelectedBox(
                                              controller
                                                  .products[productIndex.value]
                                                  .sizes[index],
                                              selectedIndex.value == index
                                                  ? Color(0XFFD9D9D9)
                                                  : Color(0XFF999999),
                                              selectedIndex.value == index
                                                  ? Colors.black
                                                  : Colors.white,
                                              index,
                                              selectedIndex),
                                        ),
                                      );
                                    },
                                  ))
                              : Container(),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            "Color",
                            style: GoogleFonts.poppins(
                                fontSize: 14.sp, fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            height: 40.h,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller
                                    .products[productIndex.value].colors.length,
                                itemBuilder: (context, index) {
                                  return Obx(
                                    () => Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: SelectedBox(
                                          controller
                                              .products[productIndex.value]
                                              .colors[index],
                                          selectedColorIndex.value == index
                                              ? Color(0XFFD9D9D9)
                                              : Color(0XFF999999),
                                          selectedColorIndex.value == index
                                              ? Colors.black
                                              : Colors.white,
                                          index,
                                          selectedColorIndex),
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                          controller.products[productIndex.value].description
                              .toString(),
                          style: Theme.of(context).textTheme.bodyLarge),
                      SizedBox(
                        height: 10,
                      ),
                      ExpansionButton(
                        title: 'Product Details',
                        description: controller
                            .products[productIndex.value].description
                            .toString(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ExpansionButton(
                        title: 'Specifications',
                        description: controller
                            .products[productIndex.value].specifications
                            .toString(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ExpansionButton(
                        title: 'Material & Care',
                        description: controller
                            .products[productIndex.value].materialAndCare
                            .toString(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ExpansionButton(
                        title: 'Rating & Reviews',
                        onTap: () {
                          Get.to(() => ReviewsPage());
                        },
                        buttonName: "See More",
                        totalReview: "10 reviews",
                        rating: RatingBar.builder(
                          itemSize: 18.sp,
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber.withOpacity(0.9),
                          ),
                          onRatingUpdate: (double value) {},
                        ),
                        description: controller
                            .products[productIndex.value].reviews[0]["comment"]
                            .toString(),
                        name: controller
                            .products[productIndex.value].reviews[0]["name"]
                            .toString(),
                        dateofrating: controller
                            .products[productIndex.value].reviews[0]["date"]
                            .toString(),
                      ),
                      SizedBox(
                        height: 20.h,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 132.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0,
                          2), // This controls the vertical offset (top shadow)
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(16)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 90.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Iconbutton(
                                  onTap: () {
                                    if (itemNumber.value > 1) {
                                      itemNumber.value = itemNumber.value - 1;
                                    } else {
                                      itemNumber.value = 1;
                                    }
                                  },
                                  icon: Icons.remove,
                                ),
                                Text(
                                  "${itemNumber}",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Iconbutton(
                                  onTap: () {
                                    itemNumber.value = itemNumber.value + 1;
                                  },
                                  icon: Icons.add,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "Total:ETB ${controller.priceCalculation(itemNumber, price_of_item)}",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ShortButton(
                              title: "Buy Now",
                              onTap: () {},
                              color: Colors.amber),
                          Obx(
                            () => ShortButton(
                                title: isAdded.value == false
                                    ? "Add to cart"
                                    : "Remove from cart",
                                onTap: isAdded.value == false
                                    ? () {
                                        isAdded.value = true;
                                        detailsToAdd = {
                                          "id": controller
                                              .products[productIndex.value].id,
                                          'total_price':
                                              controller.priceCalculation(
                                                  itemNumber, price_of_item),
                                          'single_price': price_of_item,
                                          'quantity': itemNumber,
                                          'image': controller
                                              .products[productIndex.value]
                                              .photos[0],
                                          'color': controller
                                              .products[productIndex.value]
                                              .colors[colorIndex.value],
                                          'size': controller
                                              .products[productIndex.value]
                                              .sizes[selectedIndex.value],
                                        };

                                        controller.addtoCart(detailsToAdd);
                                        Get.snackbar(
                                            colorText: Colors.white,
                                            backgroundColor: Colors.green,
                                            "successfully",
                                            "added to cart");
                                      }
                                    : () => {
                                          isAdded.value = false,
                                          controller
                                              .removeFromCart(detailsToAdd),
                                        },
                                color: Colors.blue),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// The [title] parameter is the text to display inside the box.
  /// The [bgcolor] parameter is the background color of the box.
  /// The [txtcolor] parameter is the text color of the box.
  /// The [index] parameter is the index of the box.
  ///
  /// Returns a [Widget] that represents the selected box.
  Widget SelectedBox(
    String title, // The text to display inside the box.
    Color bgcolor, // The background color of the box.
    Color txtcolor, // The text color of the box.
    int index, // The index of the box.
    RxInt selectedIndex,
  ) {
    return InkWell(
      onTap: () {
        // Print the index of the box when it is tapped.

        // Set the selected index to the index of the box tapped.
        selectedIndex.value = index;
      },
      child: Container(
        width: 50.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: bgcolor, // The background color of the box.
          borderRadius: BorderRadius.circular(3),
        ),
        child: Center(
          child: Text(
            title, // The text to display inside the box.
            style: GoogleFonts.poppins(
              color: txtcolor, // The text color of the box.
              fontSize: 11.sp, // The font size of the text.
              fontWeight: FontWeight.w500, // The font weight of the text.
            ),
          ),
        ),
      ),
    );
  }
}
