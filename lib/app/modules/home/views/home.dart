import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/modules/home/controllers/home_controller.dart';
import 'package:pazimo/app/modules/home/views/Screen/Cart_view.dart';
import 'package:pazimo/app/modules/home/views/Screen/account_view.dart';
import 'package:pazimo/app/modules/home/views/Screen/event_view.dart';
import 'package:pazimo/app/modules/home/views/Screen/home_view.dart';
import 'package:pazimo/app/modules/home/views/Screen/mydetails.dart';

import '../../../../theme/themedata.dart';
import 'Screen/Deals.dart';
import 'Screen/address.dart';
import 'Screen/help_view.dart';
import 'Screen/myorders.dart';
import 'Screen/mytickets.dart';
import 'Screen/notficationSetings.dart';
import 'Screen/saved_items_view.dart';
import 'Screen/shop.dart';

// ignore: must_be_immutable
class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  final List<String> iconSource = [
    'assets/svg/home.svg',
    'assets/svg/bag 1.png',
    'assets/images/center_icon.png',
    'assets/svg/cart.svg',
    'assets/svg/profile.svg'
  ];
  List<String> label = ["Home", "Shop", "Cart", "Me"];
  void ma(int x) {
    print(x);
  }

  // RxInt controller.selectedIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    List<Widget> Page = [
      HomeView(),
      Shop(),
      Dealsview(),
      CartView(),
      AccountScreen(),
      EventView(),
      SavedItemsPage(), //6
      MyOrdersPage(), //7
      MyTicketsPage(), //8
      MyDetailsPage(), //9
      AddressPage(), //10
      NotificationsSeting(), //11
      HelpCenter(), //12
    ];

    return Obx(
      () => Scaffold(
        backgroundColor: primary_white,
        body: Page[controller.selectedIndex.value],
        bottomNavigationBar: BottomAppBar(
          color: primary_white,
          shape: CircularNotchedRectangle(),
          notchMargin: 6.0,
          child: Container(
            height: 30.0.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  onTap: () => {
                    controller.selectedIndex.value = 0,
                  },
                  child: bottomnaveBarItem(
                    iconSource[0],
                    0,
                    label[0],
                  ),
                ),
                InkWell(
                  onTap: () => {
                    controller.selectedIndex.value = 1,
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 2),
                        width: 50.w,
                        child: Image.asset(
                          height: 22,
                          iconSource[1],
                        ),
                      ),
                      Text(
                        label[1],
                        style: GoogleFonts.poppins(
                            fontSize: 13.sp,
                            color: controller.selectedIndex.value == 1
                                ? primary_blue
                                : Colors.black),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => {
                    controller.selectedIndex.value = 2,
                  },
                  child: Container(
                      padding: EdgeInsets.only(left: 4),
                      child: Center(
                          child: Image.asset(width: 100.w, iconSource[2]))),
                ),
                InkWell(
                  onTap: () => {
                    controller.selectedIndex.value = 3,
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Stack(
                      fit: StackFit.loose,
                      children: [
                        bottomnaveBarItem(
                          iconSource[3],
                          3,
                          label[2],
                        ),
                        controller.carts.length < 1
                            ? Container()
                            : Positioned(
                                right: 0,
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.red,
                                  child: Center(
                                    child: Text(
                                      '${controller.carts.length}',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ))
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => {
                    controller.selectedIndex.value = 4,
                  },
                  child: bottomnaveBarItem(
                    iconSource[4],
                    4,
                    label[3],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomnaveBarItem(String iconSource, int index, String label) {
    return Obx(
      () => Container(
        width: 50.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              height: 20.h,

              iconSource,
              // ignore: deprecated_member_use
              color: controller.selectedIndex.value == index
                  ? primary_blue
                  : Colors.black,
            ),
            Text(
              label,
              style: GoogleFonts.poppins(
                  color: controller.selectedIndex.value == index
                      ? primary_blue
                      : Colors.black,
                  fontSize: 13.sp),
            )
          ],
        ),
      ),
    );
  }
}
