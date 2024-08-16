import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/modules/vendor/views/screen/products.dart';
import 'package:pazimo/app/modules/vendor/views/screen/withdrawal.dart';
import 'package:pazimo/theme/themedata.dart';

import '../controllers/vendor_controller.dart';
import 'screen/DashboardScreen.dart';
import 'screen/account.dart';

class VendorView extends GetView<VendorController> {
  final DashboardController dashboardController =
      Get.put(DashboardController());
  VendorView({Key? key}) : super(key: key);
  RxInt _selectedIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      DashboardPage(),
      ProductsPage(),
      WithdrawPage(),
      BusinessDetailsScreen(),
    ];

    return SafeArea(
        child: Obx(() => Scaffold(
            backgroundColor: primary_white,
            body: pages[_selectedIndex.value],
            bottomNavigationBar: BottomAppBar(
                shadowColor: primary_back,
                elevation: 10,
                surfaceTintColor: primary_white,
                color: primary_white,
                shape: CircularNotchedRectangle(),
                notchMargin: 6.0,
                child: Container(
                  height: 30.0.h,
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      itemsOfBottom(
                          0, "Overview", "assets/svg/verndor_home.svg"),
                      itemsOfBottom(
                          1, "Products", "assets/svg/verndor_product.svg"),
                      itemsOfBottom(2, "Withdraw", "assets/svg/dolar.svg"),
                      itemsOfBottom(
                          3, "Account", "assets/svg/vendor_account.svg"),
                    ],
                  ),
                )))));
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
              color: _selectedIndex.value == index ? Colors.blue : Colors.black,
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
