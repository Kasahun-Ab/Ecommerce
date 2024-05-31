import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pazimo/app/modules/home/controllers/home_controller.dart';
import 'package:pazimo/app/modules/home/views/Screen/Cart_view.dart';
import 'package:pazimo/app/modules/home/views/Screen/account_view.dart';
import 'package:pazimo/app/modules/home/views/Screen/event_view.dart';
import 'package:pazimo/app/modules/home/views/Screen/home_view.dart';
import 'package:pazimo/app/modules/home/views/Screen/product_details.dart';
import 'package:pazimo/app/modules/home/views/Screen/search_view.dart';

// ignore: must_be_immutable
class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  final List<String> iconSource = [
    'assets/svg/home.svg',
    'assets/svg/bag 1.svg',
    'assets/images/center_icon.png',
    'assets/svg/cart.svg',
    'assets/svg/profile.svg'
  ];
  List<String> label = ["Home", "Shop", "Cart", "Account"];

  @override
  Widget build(BuildContext context) {
    RxInt _selectedIndex = 0.obs;
    List<Widget> Page = [
      HomeView(),
      SearchView(),
      Container(
        child: Center(child: Text("DealsView")),
      ),
      CartView(),
      AccountScreen(),
      EventView(),
    ];

    return Obx(
      () => Scaffold(
        body: Page[controller.selectedIndex.value],
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 6.0,
          child: Container(
            height: 45.0.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  onTap: () => {
                    _selectedIndex.value = 0,
                  },
                  child: bottomnaveBarItem(
                    iconSource: iconSource[0],
                    index: 0,
                    label: label[0],
                  ),
                ),
                InkWell(
                  onTap: () => {
                    _selectedIndex.value = 1,
                  },
                  child: bottomnaveBarItem(
                    iconSource: iconSource[1],
                    index: 1,
                    label: label[1],
                  ),
                ),
                InkWell(
                    onTap: () => {
                          _selectedIndex.value = 2,
                        },
                    child: Container(
                      child: Image.asset(iconSource[2]),
                    )),
                InkWell(
                  onTap: () => {
                    _selectedIndex.value = 3,
                  },
                  child: bottomnaveBarItem(
                    iconSource: iconSource[3],
                    index: 3,
                    label: label[2],
                  ),
                ),
                InkWell(
                  onTap: () => {
                    _selectedIndex.value = 4,
                  },
                  child: bottomnaveBarItem(
                    iconSource: iconSource[4],
                    index: 4,
                    label: label[3],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class bottomnaveBarItem extends StatelessWidget {
  const bottomnaveBarItem(
      {super.key,
      required this.iconSource,
      required this.index,
      required this.label});

  final String iconSource;
  final int index;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [SvgPicture.asset(iconSource), Text(label)],
    );
  }
}
