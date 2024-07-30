import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pazimo/app/modules/Components/cart_price_list_text.dart';
import 'package:pazimo/app/modules/Components/checkout_page_text.dart';
// import 'package:pazimo/app/modules/Components/deliveradresslist.dart';
import 'package:pazimo/app/modules/Components/long_button.dart';
import 'package:pazimo/app/modules/Components/popup_dialog.dart';
import 'package:pazimo/app/modules/home/controllers/home_controller.dart';
import 'package:pazimo/theme/themedata.dart';

// import '../../../../data/address.dart';
import '../../../../../api/Api_Methods/allmethodsapi.dart';
import '../../../../data/address.dart';
import 'myorders.dart';


class CheckoutView extends StatelessWidget {
  CheckoutView({super.key});
   final Api _api = Api();
  deliverAddress? _address;
  var addressof = <Datum>[].obs;
  RxBool isDefault = false.obs;
  var selected = <RxBool>[].obs;

  @override
  Widget build(BuildContext context) {

    
    Size size = MediaQuery.of(context).size;
    final HomeController controller = Get.find<HomeController>();
   Future<void> getAddresses() async {
      try {
        final response = await _api.getAddresses();
        if (response?.data != null) {
          _address = await deliverAddress.fromJson(response!.data);
          addressof.value = _address!.data!;

          selected.value =
              addressof.map((datum) => datum.isDefault!.obs).toList();
        } else {
          _address = null;
          addressof.value = [];
        }
      } catch (e) {
        print(e.toString());
      }
    }

    getAddresses();

    void setDefaultvalue(int index) {
      for (int x = 0; x < addressof.length; x++) {
        addressof[x].isDefault = (x == index);
        selected[x].value = (x == index);
      }
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Checkout",style: GoogleFonts.poppins(color: primary_blue,fontSize: 24,fontWeight: FontWeight.w500),
      )),
      body: Padding(
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
                  InkWell(
                    onTap: (){},
                    child: Text(
                      "Change",
                      style: GoogleFonts.poppins(color: primary_blue, decoration: TextDecoration.underline,),
                    ),
                  ),
                ],
              ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: addressof.length,
                  itemBuilder: (context, index) {
                    return Obx(
                      () => Container(
                        margin: EdgeInsets.only(top: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(width: 1, color: Color(0xffE6E6E6))),
                        child: ListTile(
                          leading: SvgPicture.asset("assets/svg/Location.svg"),
                          title: Text(
                            "${addressof[index].city}",
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: primary_blue),
                          ),
                          subtitle: Text("${addressof[index].companyName}",
                              style: GoogleFonts.poppins(
                                  fontSize: 14, color: Color(0xff808080))),
                          trailing: Container(
                            height: 20,
                            width: 20,
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 1,
                                  color: primary_blue,
                                )),
                            child: selected[index].value
                                ? Container(
                                    width: 13,
                                    height: 13,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: primary_blue))
                                : null,
                          ),
                          onTap: () {
                            setDefaultvalue(index);
                            
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
              SizedBox(
                height: 20,
              ),
              checkout_page_text(
                title: 'Payment Methods',
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
                      Divider(
                        color: Color.fromARGB(174, 128, 128, 128),
                      ),
                      SizedBox(height: 10),
                      cart_price_text(
                        Sub_total: 'Total',
                        price: controller.sub_total,
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
                              color: primary_blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "add",
                                style: GoogleFonts.poppins(color: Colors.white),
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
                  color: primary_blue,
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
                                                backgroundColor: Color.fromARGB(
                                                    255, 139, 138, 138),
                                              )),
                                          Positioned(
                                              right: -16,
                                              bottom: 0,
                                              child: CircleAvatar(
                                                radius: 15,
                                                backgroundColor: Color.fromARGB(
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
                                    color: primary_blue,
                                    onPressed: () {
                                      Get.back();
                                      Get.dialog(popupDialogbox(
                                        title: 'Congratulation!',
                                        message: 'Your order has been placed.',
                                        onPressed: () {
                                          Get.off(MyOrdersPage());
                                        },
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
                  hasIcon: false),
              SizedBox(
                height: 13,
              )
            ],
          ),
        ),
      ),
    );
  }

  // Widget deliverAdressList(
  //   String title,
  //   String address,
  // ) {

  //   return InkWell(
  //     onTap: () {
  //       title == 'home' ? isHome.value = true : isHome.value = false;
  //     },
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.symmetric(vertical: 10.0),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: [
  //               SvgPicture.asset('assets/svg/Location.svg'),
  //               SizedBox(width: 10.w),
  //               Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     title,
  //                     style: GoogleFonts.poppins(
  //                         color: primary_blue,
  //                         fontSize: 16,
  //                         fontWeight: FontWeight.w500),
  //                   ),
  //                   Text(
  //                     address,
  //                     style: GoogleFonts.poppins(
  //                         color: Color(0Xff808080), fontSize: 14),
  //                   ),
  //                 ],
  //               )
  //             ],
  //           ),
  //         ),
  //         Obx(
  //           () => Container(
  //             height: 20,
  //             width: 20,
  //             decoration: BoxDecoration(
  //                 border: Border.all(width: 2),
  //                 shape: BoxShape.circle,
  //                 color: Colors.white),
  //             child: Center(
  //               child: isHome.value
  //                   ? Container(
  //                       height: 12,
  //                       width: 12,
  //                       decoration: BoxDecoration(
  //                           // border: Border.all(width: 2),
  //                           shape: BoxShape.circle,
  //                           color: const Color.fromARGB(255, 0, 0, 0)),
  //                     )
  //                   : Container(),
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
