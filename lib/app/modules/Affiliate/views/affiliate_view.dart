import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../vendor/views/screen/account.dart';
import '../../vendor/views/screen/withdrawal.dart';
import '../controllers/affiliate_controller.dart';
import 'screen/AffiliateDashbord.dart';
import 'screen/commistionDetails.dart';

// ignore: must_be_immutable
class AffiliateView extends GetView<AffiliateController> {
  AffiliateView({Key? key}) : super(key: key);
  final _selectedIndex = 0.obs;
  Color secondaryBlue = Color(0xff0A4B93);
  Color primaryBlue = Color(0xff115DB1);
  Color black = Color.fromARGB(255, 0, 0, 0);
 
  @override
  Widget build(BuildContext context) {
    List<Widget> _screen = [
      AffiliateDashbord(),
      CommissionScreen(),
      WithdrawPage(),
      BusinessDetailsScreen()
    ];
    return Scaffold(
        body: Obx(() => _screen[_selectedIndex.value]),
        bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 6.0,
            child: Container(
              height: 30.0.h,
              padding: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  itemsOfBottom(0, "Overview", "assets/svg/verndor_home.svg"),
                  itemsOfBottom(
                      1, "Products", "assets/svg/verndor_product.svg"),
                  itemsOfBottom(2, "Withdraw", "assets/svg/dolar.svg"),
                  itemsOfBottom(3, "Account", "assets/svg/vendor_account.svg"),
                ],
              ),
            )));
  }

  Widget itemsOfBottom(int index, String title, String icons) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          _selectedIndex.value = index;
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              color: _selectedIndex.value == index ? primaryBlue : Colors.black,
              icons,
              width: 25,
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              title,
              style: GoogleFonts.poppins(fontSize: 13, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
