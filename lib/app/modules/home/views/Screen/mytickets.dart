import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/modules/home/controllers/home_controller.dart';
import 'package:pazimo/app/modules/home/views/Screen/myorderd_Or_myticketcard.dart';
import 'package:pazimo/app/modules/home/views/Screen/myticketsDetails.dart';

class MyTicketsPage extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    RxInt _isselected = 0.obs;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'My Tickets',
            style: GoogleFonts.poppins(fontSize: 16),
          ),
        ),
        body: Column(
          children: [
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
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
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(() => myticketsDetails());
                          },
                          child: OrderCard(
                            statusOfcomplate: 'inProgress',
                            itemSize: '',
                            titleofButton: 'See Ticket',
                            itemName: 'Hiking trip',
                            itemPrice: 'Soho lodge',
                          ),
                        )
                      ],
                    ),
                    ListView.builder(
                        itemCount: controller.orders.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                Get.to(() => myticketsDetails());
                              },
                              child: OrderCard(
                                statusOfcomplate: 'inProgress',
                                itemSize: '',
                                titleofButton: 'See Ticket',
                                itemName: 'Hiking trip',
                                itemPrice: 'Soho lodge',
                              ));
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
