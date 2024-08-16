import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/modules/Components/icon_button.dart';
import 'package:pazimo/app/modules/Components/short_button.dart';
import 'package:pazimo/app/modules/home/controllers/home_controller.dart';

import '../../../../../theme/themedata.dart';

// ignore: must_be_immutable
class EventDetailPage extends StatelessWidget {
  EventDetailPage({required this.eventName});
  final String eventName;
  final double imageHeight = 400.0; // Adjust this value as needed

  // final int productIndex;
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
    return Scaffold(
       backgroundColor: primary_white,
      appBar: AppBar(
         backgroundColor: primary_white,
        title: Text(
          'Event details',
          style: GoogleFonts.poppins(
              color: Color(0xff115DB1)), // Set app bar text color to blue
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff115DB1), // Set arrow color to blue
          ),
          onPressed: () {
            // Navigate back to the previous screen
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    height: imageHeight
                        .h, // Set the height of the SizedBox to control the image height
                    width: 400.0.h,
                    'assets/images/events.jpg', // Replace 'images/events_image.png' with your image asset path
                    fit: BoxFit
                        .cover, // Cover the entire SizedBox with the image
                  ),
                ),
                SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Valentine festival',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Text(
                              '\ETB 200',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        SvgPicture.asset(
                          width: 20,
                          'assets/svg/Location-filled.svg',
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Sheraton Addis hotel',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Color(0xffB3B3B3),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Row(
                      children: [
                        SvgPicture.asset(width: 20, 'assets/svg/timer.svg'),
                        SizedBox(width: 8),
                        Text(
                          'Time:16:00 PM',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.normal,
                            color: Color(0xff999999),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 100.w,
                              height: 50,
                            ),
                            Positioned(
                                width: 50.w,
                                top: 0,
                                left: 0,
                                child:
                                    Image.asset("assets/images/person2.png")),
                            Positioned(
                                width: 50.w,
                                top: 0,
                                left: 10,
                                child:
                                    Image.asset("assets/images/person3.png")),
                            Positioned(
                                top: 0,
                                left: 20,
                                child: Image.asset(
                                    width: 50.w, "assets/images/person4.png")),
                            Positioned(
                                top: 0,
                                left: 30,
                                child: Image.asset(
                                    width: 50.w, "assets/images/person5.png")),
                            Positioned(
                                top: 0,
                                left: 40,
                                child: Image.asset(
                                    width: 50.w, "assets/images/person1.png")),
                          ],
                        ),
                        SizedBox(width: 38),
                        Text(
                          '1000+',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Color(0xff115DB1),
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          'People have Joined:',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.normal,
                            color: Color(0xff666666),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Description',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff808080),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      'The iPhone 15 features a 6.1-inch (155 mm) display with Super Retina XDR OLED technology at a resolution of 2556×1179 pixels and a pixeldensity of about 460 PPI with a refresh.',
                      style: GoogleFonts.poppins(
                        letterSpacing: 1.2,
                        color: Color(0xffB3B3B3),
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ],
            ),
          )),
          Obx(()=> Container(
              height: 132.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: Offset(
                        0, 2), // This controls the vertical offset (top shadow)
                  ),
                ],
              ),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
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
                                style: Theme.of(context).textTheme.titleMedium,
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
                            title: "Buy Now", onTap: () {}, color: Colors.amber),
                        Obx(
                          () => ShortButton(
                              title: isAdded.value == false
                                  ? "Add to cart"
                                  : "Remove from cart",
                              onTap: isAdded.value == false
                                  ? () {
                                      isAdded.value = true;
                                      // detailsToAdd = {
                                      //   "id": controller
                                      //       .products[productIndex].id,
                                      //   'total_price':
                                      //       controller.priceCalculation(
                                      //           itemNumber, price_of_item),
                                      //   'single_price': price_of_item,
                                      //   'quantity': itemNumber,
                                      //   'image': controller
                                      //       .products[productIndex].photos[0],
                                      //   'color': controller
                                      //       .products[productIndex]
                                      //       .colors[colorIndex.value],
                                      //   'size': controller
                                      //       .products[productIndex]
                                      //       .sizes[selectedIndex.value],
                                      // };
            
                                      // controller.addtoCart(detailsToAdd);
                                    }
                                  : () => {
                                        isAdded.value = false,
                                        controller.removeFromCart(detailsToAdd),
                                      },
                              color: Color(0xff115DB1)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
