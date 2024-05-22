import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/modules/home/controllers/home_controller.dart';
import 'package:pazimo/app/modules/home/views/Screen/myorderd_Or_myticketcard.dart';

class MyOrdersPage extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    RxInt _isselected = 0.obs;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Orders'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Obx(
                () => Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFE6E6E6),
                      borderRadius: BorderRadius.circular(10)),
                  height: 54.h,
                  child: TabBar(
                    onTap: (value) => {
                      _isselected.value = value,
                    },
                    dividerColor: Colors.transparent,
                    indicatorColor: Colors.transparent,
                    tabs: [
                      Tab(
                        child: Container(
                          height: 30,
                          width: 230,
                          decoration: BoxDecoration(
                              color: _isselected.value == 0
                                  ? Colors.white
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "Ongoing",
                              style: GoogleFonts.poppins(
                                  color: _isselected.value == 0
                                      ? Colors.blue
                                      : Color(0xFF999999)),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 30,
                          width: 230,
                          decoration: BoxDecoration(
                              color: _isselected.value == 1
                                  ? Colors.white
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "Completed",
                              style: GoogleFonts.poppins(
                                  color: _isselected.value == 1
                                      ? Colors.blue
                                      : Color(0xFF999999)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 14,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TabBarView(
                  children: [
                    Obx(() => Column(
                          children: [
                            OrderCard(
                              statusOfcomplate: 'In Route',
                              titleofButton: 'Track Order',
                              itemName: controller.orders[1].name,
                              itemPrice: controller.orders[1].price.toString(),
                            )
                          ],
                        )), // Placeholder for ongoing orders
                    Obx(() {
                      return ListView.builder(
                        itemCount: controller.orders.length,
                        itemBuilder: (context, index) {
                          final order = controller.orders[index];
                          return OrderCard(
                            statusOfcomplate: 'complated',
                            titleofButton: 'Leave Review',
                            itemName: controller.orders[index].name,
                            itemPrice:
                                controller.orders[index].price.toString(),
                          );
                        },
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
