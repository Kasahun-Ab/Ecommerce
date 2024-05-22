import 'package:flutter/material.dart';
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
    'assets/svg/search.svg',
    'assets/images/center_icon.png',
    'assets/svg/cart.svg',
    'assets/svg/profile.svg'
  ];
  List<String> label = ["Home", "Search", "Cart", "Account"];

  @override
  Widget build(BuildContext context) {
    List<Widget> Page = [
      HomeView(),
      SearchView(),
      Container(
        child: Center(child: Text("DealsView")),
      ),
      CartView(),
      AccountScreen(),
      EventView(),
      ProductDetailView(
        productIndex: controller.selectedProductIndex,
      ),
    ];

    return Obx(
      () => Scaffold(
          body: Page[controller.selectedIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            elevation: 50,
            type: BottomNavigationBarType.fixed,
            onTap: (value) => {
              controller.selectedIndex.value = value,
            },
            selectedItemColor: Colors.blue,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  iconSource[0],
                  width: 20,

                  // ignore: deprecated_member_use
                  color: controller.selectedIndex.value <= 4
                      ? controller.selectedIndex.value == 0
                          ? Colors.blue
                          : Colors.black
                      : Colors.black,
                  height: 20,
                ),
                label: label[0],
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  iconSource[1],
                  width: 20,
                  height: 20,
                  // ignore: deprecated_member_use
                  color: controller.selectedIndex.value <= 4
                      ? controller.selectedIndex.value == 1
                          ? Colors.blue
                          : Colors.black
                      : Colors.black,
                ),
                label: label[1],
              ),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    iconSource[2],
                    fit: BoxFit.fill,
                    width: 50,
                    height: 20,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  iconSource[3],
                  width: 20,
                  height: 20,
                  // ignore: deprecated_member_use
                  color: controller.selectedIndex.value <= 4
                      ? controller.selectedIndex.value == 3
                          ? Colors.blue
                          : Colors.black
                      : Colors.black,
                ),
                label: label[2],
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  iconSource[4],
                  width: 20,
                  height: 20,
                  // ignore: deprecated_member_use
                  color: controller.selectedIndex.value <= 4
                      ? controller.selectedIndex.value == 4
                          ? Colors.blue
                          : Colors.black
                      : Colors.black,
                ),
                label: label[3],
              ),
            ],
            currentIndex: controller.selectedIndex.value <= 4
                ? controller.selectedIndex.value
                : 0,
          )),
    );
  }
}
