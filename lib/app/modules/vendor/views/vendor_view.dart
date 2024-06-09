import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/vendor_controller.dart';
import 'screen/DashboardScreen.dart';

class VendorView extends GetView<VendorController> {
  const VendorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: DashboardScreen()),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Overview'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag), label: 'Products'),
            BottomNavigationBarItem(
                icon: Icon(Icons.attach_money), label: 'Withdraw'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Account'),
          ],
        ),
      ),
    );
  }
}
