import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../Components/popup_dialog.dart';
import '../../../components/long_button.dart';

class WithdrawPage extends StatelessWidget {
  TextEditingController _ammountController =
      TextEditingController(text: 'ETB 14000');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Withdraw',
          style: TextStyle(color: Color(0xff115DB1)),
        ),
        iconTheme: IconThemeData(color: Color(0xff115DB1)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Available Balance',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffE6E6E6), width: 1),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ETB 14,000",
                          style: GoogleFonts.poppins(
                              color: Colors.green,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Money here is available for transfer")
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Choose your bank',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xffE6E6E6))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xffE6E6E6))),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.account_balance),
                            SizedBox(
                                width: 10), // Add some space between the icons
                            Icon(Icons.account_balance_wallet),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Full Name',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your full name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xffE6E6E6))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xffE6E6E6))),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Mobile Number',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your mobile number',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xffE6E6E6))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xffE6E6E6))),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, -2),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    'Enter Amount: ETB 1,000',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        showModal(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff115DB1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                      ),
                      child: Text(
                        'Withdraw',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showModal(BuildContext context) {
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
                      CircleAvatar(
                        radius: 40,
                        child: Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 30,
                        ),
                        backgroundColor: Colors.green,
                      ),
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
                            fontSize: 10, color: Color(0xff666666)),
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
                                                child: Container(
                                                  color: index % 2 == 0
                                                      ? Colors.transparent
                                                      : Color(0xff999999),
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
                                    Color.fromARGB(255, 139, 138, 138),
                              )),
                          Positioned(
                              right: -16,
                              bottom: 0,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor:
                                    Color.fromARGB(255, 139, 138, 138),
                              ))
                        ],
                      ),
                      Container(
                        width: 314,
                        padding: EdgeInsets.only(left: 16),
                        margin: EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Order number",
                              style: GoogleFonts.poppins(
                                  fontSize: 13, fontWeight: FontWeight.normal),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Delivery Address",
                              style: GoogleFonts.poppins(
                                  fontSize: 13, fontWeight: FontWeight.normal),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Amount",
                              style: GoogleFonts.poppins(
                                  fontSize: 13, fontWeight: FontWeight.normal),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Date and time",
                              style: GoogleFonts.poppins(
                                  fontSize: 13, fontWeight: FontWeight.normal),
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              SvgPicture.asset("assets/svg/download.svg"),
                              Text("Download")
                            ],
                          ),
                          Column(
                            children: [
                              SvgPicture.asset("assets/svg/share.svg"),
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
                    color: Color(0xff115DB1),
                    onPressed: () {
                      Get.back();
                      Get.dialog(popupDialogbox(
                        title: 'Congratulation!',
                        message: 'Your order has been placed.',
                        onPressed: () {
                          // Get.off(MyOrdersPage());
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
  }

  Widget buildDetailColumn(String title, String detail) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 5),
          Text(
            detail,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final radius = 10.0;

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.arcToPoint(
      Offset(size.width - radius, 0),
      radius: Radius.circular(radius),
      clockwise: false,
    );
    path.lineTo(radius, 0);
    path.arcToPoint(
      Offset(0, radius),
      radius: Radius.circular(radius),
      clockwise: false,
    );
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
