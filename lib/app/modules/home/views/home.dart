import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazimo/app/modules/Components/bottom_nav_bar.dart';
import 'package:pazimo/app/modules/home/controllers/home_controller.dart';
import 'package:pazimo/app/modules/home/views/Screen/Account_view.dart';
import 'package:pazimo/app/modules/home/views/Screen/Cart_view.dart';
import 'package:pazimo/app/modules/home/views/Screen/home_view.dart';
import 'package:pazimo/app/modules/home/views/Screen/search_view.dart';

// ignore: must_be_immutable
class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  RxInt selectedIndex = 2.obs;
  final List<String> iconSource = [
    'assets/svg/home.svg',
    'assets/svg/search.svg',
    'assets/images/center_icon.png',
    'assets/svg/cart.svg',
    'assets/svg/profile.svg'
  ];
  List<String> label = ["Home", "Search", "Cart", "Account"];
  List<Widget> Page = [
    HomeView(),
    SearchView(),
    CartView(),
    AccountView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Page[2];
        },
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: selectedIndex,
        iconSource: iconSource,
        label: label,
      ),
    );
  }
}
