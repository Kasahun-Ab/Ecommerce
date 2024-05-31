import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pazimo/app/modules/Components/cart_price_list_text.dart';
import 'package:pazimo/app/modules/Components/checkout_page_text.dart';
import 'package:pazimo/app/modules/Components/deliveradresslist.dart';
import 'package:pazimo/app/modules/Components/long_button.dart';
import 'package:pazimo/app/modules/Components/popup_dialog.dart';
import 'package:pazimo/app/modules/home/controllers/home_controller.dart';
// import '../../../Components/cart_price_text.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final HomeController controller = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Checkout"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  color: Colors.black12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    checkout_page_text(
                      title: 'Delivery Address',
                    ),
                    Text(
                      "Change",
                    ),
                  ],
                ),
                deliverAdressList(
                  title: 'Home',
                  address: 'Alem Bank, near the round about',
                  ontap: () {
                    controller.isHome.value = true;
                  },
                ),
                Divider(
                  height: 1,
                  color: Colors.black12,
                ),
                deliverAdressList(
                  title: 'Work',
                  address: 'Saris, Mebrat haile zor endalek',
                  ontap: () {
                    controller.isHome.value = false;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                checkout_page_text(
                  title: 'Delivery Address',
                ),
                SizedBox(
                  height: 20,
                ),
                Button(
                  title: "Chapa",
                  color: Colors.green,
                  onPressed: () {},
                  hasBorder: false,
                  iconDirectionIsRight: false,
                  hasIcon: true,
                  iconSource: 'assets/svg/Card.svg',
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    width: size.width,
                    child: Column(
                      children: [
                        cart_price_text(
                          Sub_total: 'Sub-total',
                          price: controller.sub_total,
                        ),
                        SizedBox(height: 10.h),
                        cart_price_text(
                          Sub_total: 'Vat(%)',
                          price: controller.vat,
                        ),
                        SizedBox(height: 10.h),
                        cart_price_text(
                          Sub_total: 'Shipping fee',
                          price: controller.shippingFee,
                        ),
                        SizedBox(height: 10.h),
                        Divider(
                          color: Color(0Xff808080),
                        ),
                        SizedBox(height: 10),
                        cart_price_text(
                          Sub_total: 'Total',
                          price: controller.total,
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Color(0Xff808080)),
                                ),
                                child: Row(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    SvgPicture.asset("assets/svg/Vector.svg"),
                                    Expanded(
                                      child: TextField(
                                          decoration: InputDecoration(
                                              hintText: "Promo code",
                                              hintStyle: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300,
                                                  color: Color(0Xff808080)),
                                              // contentPadding:
                                              //     EdgeInsets.only(bottom: 5, left: 10),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ))),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 45,
                              width: 68,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "add",
                                  style:
                                      GoogleFonts.poppins(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                Button(
                    title: "Place Order",
                    color: Colors.blue,
                    onPressed: () {
                      Get.dialog(
                        Center(
                          child: Container(
                            height: 680.h,
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Scaffold(
                              backgroundColor: Colors.transparent,
                              body: Column(
                                children: [
                                  Container(
                                    height: 566.h,
                                    width: 314.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Lottie.asset(
                                            repeat: false,
                                            "assets/lottie/success.json"),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Payment  Confirmed",
                                          style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          "You will be notified when the withdrawal \nis credited to your bank account",
                                          style: GoogleFonts.poppins(
                                              fontSize: 10,
                                              color: Color(0xff666666)),
                                        ),
                                        Stack(
                                          children: [
                                            SizedBox(
                                              height: 30,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: SizedBox(
                                                      width: double.infinity,
                                                      height: 1,
                                                      child: Row(
                                                        children: List.generate(
                                                            700 ~/ 10,
                                                            (index) => Expanded(
                                                                  child:
                                                                      Container(
                                                                    color: index %
                                                                                2 ==
                                                                            0
                                                                        ? Colors
                                                                            .transparent
                                                                        : Color(
                                                                            0xff999999),
                                                                    height: 2,
                                                                  ),
                                                                )),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                                left: -16,
                                                bottom: 0,
                                                child: CircleAvatar(
                                                  radius: 15,
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          255, 139, 138, 138),
                                                )),
                                            Positioned(
                                                right: -16,
                                                bottom: 0,
                                                child: CircleAvatar(
                                                  radius: 15,
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          255, 139, 138, 138),
                                                ))
                                          ],
                                        ),
                                        Container(
                                          width: 314,
                                          padding: EdgeInsets.only(left: 16),
                                          margin: EdgeInsets.only(bottom: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Order number",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              Text("#203225632132",
                                                  style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ))
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 314,
                                          padding: EdgeInsets.only(left: 16),
                                          margin: EdgeInsets.only(bottom: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Delivery Address",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              Text("Home",
                                                  style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ))
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 314,
                                          padding: EdgeInsets.only(left: 16),
                                          margin: EdgeInsets.only(bottom: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Amount",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              Text("ETB 2988.99",
                                                  style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ))
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 314,
                                          padding: EdgeInsets.only(left: 16),
                                          margin: EdgeInsets.only(bottom: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Date and time",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              Text("09/04/2024 06:12 PM",
                                                  style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ))
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              children: [
                                                SvgPicture.asset(
                                                    "assets/svg/download.svg"),
                                                Text("Download")
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                SvgPicture.asset(
                                                    "assets/svg/share.svg"),
                                                Text("Share")
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Button(
                                      title: "Done",
                                      color: Colors.blue,
                                      onPressed: () {
                                        Get.back();
                                        Get.dialog(popupDialogbox(
                                          title: 'Congratulation!',
                                          message:
                                              'Your order has been placed.',
                                          onPressed: () {},
                                          buttontitle: 'Track Your Order',
                                        ));
                                      },
                                      hasBorder: false,
                                      iconDirectionIsRight: true,
                                      hasIcon: false)
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    hasBorder: false,
                    iconDirectionIsRight: true,
                    hasIcon: false)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
