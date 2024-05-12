import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/modules/Components/Expantion_button.dart';
import 'package:pazimo/app/modules/Components/short_button.dart';
import 'package:pazimo/app/modules/home/controllers/home_controller.dart';
import '../../../Components/icon_button.dart';

// ignore: must_be_immutable
class ProductDetailView extends StatelessWidget {
  ProductDetailView({super.key});
  RxInt itemNumber = 1.obs;
  RxInt price_of_item = 78000.obs;
  RxInt selectedIndex = 0.obs;

  Map<String, dynamic> detailsToAdd = {
    'product_name': "",
    'color': '',
    'storage': '',
    'price': 0,
    'description': "",
    'image': "",
    'brand': "",
    'rating': 0,
    // Add more key-value pairs as needed
  };
  RxInt colorIndex = 0.obs;
  final HomeController controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    List<String> listStorage = [
      "64 GB",
      "128 GB",
      " 256 GB",
    ].obs;
    Map<String, Color> listColor = {
      'blue': Colors.blue,
      'black': Colors.black,
      'red': Colors.red,
      'green': Colors.green,
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product details",
          style: GoogleFonts.poppins(
              fontSize: 24, fontWeight: FontWeight.w400, color: Colors.blue),
        ),
      ),
      body: Obx(
        () => Container(
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
                            height: 350.h,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Color(0xFFE6E6E6),
                              borderRadius: BorderRadius.circular(
                                  ScreenUtil().setWidth(10)),
                            ),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Image.asset("assets/images/phone.png"),
                            )),
                          ),
                          Positioned(
                              top: 34.h,
                              right: 34.w,
                              child: InkWell(
                                radius: 20.r,
                                onTap: () {
                                  print("liked");
                                },
                                child: Container(
                                  child: Center(
                                    child: SvgPicture.asset(
                                        width: 46.h,
                                        height: 46.w,
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
                            "Apple",
                            style: GoogleFonts.poppins(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w300,
                                color: Color(0xFFB3B3B3)),
                          ),
                          RatingBar.builder(
                            itemSize: 18.sp,
                            initialRating: 3,
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
                          listStorage.length > 0
                              ? SizedBox(
                                  height: 40.h,
                                  child: ListView.builder(
                                    itemCount: listStorage.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Obx(
                                          () => SelectedBox(
                                              listStorage[index],
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
                                  ),
                                )
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
                          Row(
                            children: List.from(listColor.entries.mapIndexed(
                              (index, e) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: SelectedBox(
                                      e.key,
                                      e.value,
                                      Colors.white,
                                      index, // Remove the extra comma here
                                      colorIndex // Assuming colorIndex is defined elsewhere

                                      ),
                                );
                              },
                            ).toList()),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                          "The iPhone 15 features a 6.1-inch (155 mm)  display with Super Retina XDR OLED technology at a resolution of 2556×1179 pixels and a pixel density of about 460 PPI with a refresh",
                          style: Theme.of(context).textTheme.bodyLarge),
                      SizedBox(
                        height: 10,
                      ),
                      ExpansionButton(
                        title: 'Product Details',
                        description:
                            'He moonlights difficult engrossed, sportsmen interested has all Devonshire difficulty gay assistance joy.For who thoroughly conviction.',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ExpansionButton(
                        title: 'Specifications',
                        description:
                            'He moonlights difficult engrossed, sportsmen interested has all Devonshire difficulty gay assistance joy.For who thoroughly conviction.',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ExpansionButton(
                        title: 'Material & Care',
                        description:
                            'He moonlights difficult engrossed, sportsmen interested has all Devonshire difficulty gay assistance joy.For who thoroughly conviction.',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ExpansionButton(
                        title: 'Rating & Reviews',
                        onTap: () {},
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
                        description:
                            'He moonlights difficult engrossed, sportsmen interested has all Devonshire difficulty gay assistance joy.For who thoroughly conviction.',
                        name: "Abebe kenobi",
                        dateofrating: "6 day ago",
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
                              title: 'Buy now',
                              onTap: () {},
                              color: Colors.amber),
                          ShortButton(
                              title: 'Add to cart',
                              onTap: () {
                                detailsToAdd = {
                                  'title': "Iphone 15 pro max",
                                  'price': controller.priceCalculation(
                                      itemNumber, price_of_item),
                                  'single_price': price_of_item,
                                  'quantity': itemNumber,
                                  'image': "assets/images/iphone.png",
                                  'color': listColor[colorIndex.value],
                                  'size': listStorage[selectedIndex.value],
                                };
                                controller.addtoCart(detailsToAdd);
                                print(
                                    "added to cart ${controller.carts.length}");
                              },
                              color: Colors.blue)
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
        print(index);

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
