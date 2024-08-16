import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../theme/themedata.dart';
import '../../../vendor/views/screen/DashboardScreen.dart';
// import '../../../vendor/views/screen/analytics.dart';

class Deliverydashboord extends StatelessWidget {
  Deliverydashboord({super.key});
  List<ChartData> getChartData() {
    return [
      ChartData(1, 35),
      ChartData(2, 28),
      ChartData(3, 34),
      ChartData(4, 32),
      ChartData(5, 40),
      ChartData(6, 5),
    ];
  }

  List<ChartData> getSecondChartData() {
    return [
      ChartData(1, 5),
      ChartData(2, 8),
      ChartData(3, 50),
      ChartData(4, 32),
      ChartData(5, 40),
      ChartData(6, 60),
    ];
  }

  final RxInt _selectedIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primary_white,
        appBar: AppBar(
          backgroundColor: primary_white,
          forceMaterialTransparency: true,
          centerTitle: true,
          title: Text(
            "Home",
            style: GoogleFonts.poppins(fontSize: 32),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("active order"),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: MediaQuery.of(context).size.width.w,
                    height: 177.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // Shadow color
                            spreadRadius: 1, // Spread radius
                            blurRadius: 10, // Blur radius
                            offset: Offset(0, 1), // Shadow offset (x, y)
                          ),
                        ]),
                    child: Center(
                      child: Text('no active order'),
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primary_white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Shadow color
                          spreadRadius: 1, // Spread radius
                          blurRadius: 10, // Blur radius
                          offset: Offset(0, 1), // Shadow offset (x, y)
                        ),
                      ]),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("ETB",
                              style: GoogleFonts.poppins(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                  color: primary_blue)),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "40,000",
                            style: GoogleFonts.poppins(
                                fontSize: 27,
                                color: Colors.blue,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Earning’s",
                              style: GoogleFonts.poppins(fontSize: 21)),
                          Text(
                            "+3.2",
                            style: GoogleFonts.poppins(color: Colors.green),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Commissions",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600, fontSize: 15),
                ),
                SfCartesianChart(
                  borderColor: Colors.black12,
                  // primaryXAxis: NumericAxis(),
                  series: <SplineSeries<ChartData, double>>[
                    SplineSeries<ChartData, double>(
                      dataSource: getChartData(),
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                    ),
                    SplineSeries<ChartData, double>(
                      dataSource:
                          getSecondChartData(), // Another data source for the second line
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  itemsOfBottom(0, "Home", "assets/svg/verndor_home.svg"),
                  itemsOfBottom(1, "Products", "assets/svg/shop.svg"),
                  itemsOfBottom(2, "Account", "assets/svg/vendor_account.svg"),
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
