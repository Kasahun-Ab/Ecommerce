import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/theme/themedata.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'analytics.dart';
import 'products.dart';
// import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class DashboardPage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  ScrollControllerWidget() {
    // Initialize FabController
    Get.put(FabController());
    final FabController fabController = Get.find();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          fabController.hideFab();
        } else {
          fabController.showFab();
        }
      } else {
        fabController.hideFab();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ScrollControllerWidget();
    return Scaffold(

      backgroundColor: primary_white,
      floatingActionButton: GetX<FabController>(
        builder: (controller) {
          return controller.isFabVisible.value
              ? GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(16)),
                    child: Icon(Icons.add),
                  ),
                )
              : SizedBox.shrink();
        },
      ),
      
      appBar: AppBar(
       
     surfaceTintColor: primary_white,
       backgroundColor: primary_white,
       shadowColor: const Color.fromARGB(113, 0, 0, 0),
       elevation: 1,
        leading: Icon(
          Icons.arrow_back,
          color: Color(0xff115DB1),
        ),
        centerTitle: true,
        title: Text(
          'Dashboard',
          style: GoogleFonts.poppins(color: Color(0xff115DB1)),
        ),
        iconTheme: IconThemeData(color: Color(0xff115DB1)),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onTap: () {
                        // isSegestion.value = true;
                      },
                      onSubmitted: (value) {
                        // isSegestion.value = false;
                      },
                      // controller: textController,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: "search Pazimo",
                        hintStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          color: Color(0xff666666),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Add your search logic here
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 5),
                      width: 58,
                      height: 39,
                      decoration: BoxDecoration(
                        color: Color(0xff115DB1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    // Get.to(AnalyticsPage());
                  },
                  child: Text(
                    'Analytics',
                    style: GoogleFonts.poppins(
                        fontSize: 24.sp, fontWeight: FontWeight.w600),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Get.to(AnalyticsPage());
                    },
                    child: Icon(Icons.arrow_forward, color: Color(0xff115DB1))),
              ],
            ),
            SizedBox(height: 20),

            // Step 3: Add four containers
            Row(
              children: [
                _buildAnalyticsContainer(
                  icon: Icons.attach_money,
                  price: '\ETB 40,000',
                  text: 'Net sales',
                  percentage: '+32%',
                  iconColor: Colors.green,
                ),
                SizedBox(width: 10),
                _buildAnalyticsContainer(
                  icon: Icons.remove_red_eye_rounded,
                  price: '\207',
                  text: 'Total visitors',
                  percentage: '-20%',
                  iconColor: Colors.black,
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                _buildAnalyticsContainer(
                  icon: Icons.add_box_sharp,
                  price: '\63',
                  text: 'Live products',
                  percentage: '+10%',
                  iconColor: Colors.yellow,
                ),
                SizedBox(width: 10),
                _buildAnalyticsContainer(
                  icon: Icons.ramp_right_outlined,
                  price: '\28',
                  text: 'Completed',
                  percentage: '-5%',
                  iconColor: Colors.green,
                ),
              ],
            ),
            SizedBox(height: 20),

            // Step 4: Add Orders header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Orders',
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'See all orders',
                  style: GoogleFonts.poppins(
                      fontSize: 16, color: Color(0xff115DB1)),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Step 5: Add time filters
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTimeFilter('1W'),
                _buildTimeFilter('4W'),
                _buildTimeFilter('1Y'),
                _buildTimeFilter('MTD'),
                _buildTimeFilter('QTD'),
              ],
            ),
            SizedBox(height: 20),

            // Step 6: Add large container for order details
            Center(
              child: _buildOrderDetailsContainer(),
            ),

            // Additional Container (example)
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      orderText("Order no.", "#202402220-0002322"),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "ETB 78,000",
                            style: GoogleFonts.poppins(
                                color: Color(0xff115DB1),
                                fontWeight: FontWeight.w700,
                                fontSize: 23),
                          ),
                          Text(
                            "paid",
                            style: GoogleFonts.poppins(
                                color: Colors.green,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      )
                    ],
                  ),
                  orderText("Customer Name ", "Abebe Chala"),
                  SizedBox(height: 10),
                  orderText("Delivery Status", "Pending"),
                  SizedBox(height: 10),
                  orderText("Product", "Iphone 15 pro max"),
                  SizedBox(height: 10),
                  orderText("Order date", "2 April 2024 04:25 PM"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column orderText(String upper, String lower) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          upper,
          style: GoogleFonts.poppins(color: Color(0xff333333), fontSize: 16),
        ),
        Text(
          lower,
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildAnalyticsContainer({
    required IconData icon,
    required String price,
    required String text,
    required String percentage,
    required Color iconColor,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Get.to(ProductsPage());
        },
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price,
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff115DB1)),
                  ),
                  Icon(icon, color: iconColor, size: 32),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    percentage,
                    style: GoogleFonts.poppins(color: Colors.green),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeFilter(String text) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        bool isSelected = controller.selectedFilter == text;
        return GestureDetector(
          onTap: () {
            controller.updateSelectedFilter(text);
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: isSelected ? Colors.grey : Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white),
            ),
            child: Text(
              text,
              style: GoogleFonts.poppins(
                  color: isSelected ? Colors.white : Colors.black),
            ),
          ),
        );
      },
    );
  }

  Widget _buildOrderDetailsContainer() {
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

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // New Orders Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('New Orders',
                        style: GoogleFonts.poppins(fontSize: 18)),
                    SizedBox(height: 10),
                    Text('870',
                        style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff115DB1))),
                    SizedBox(height: 10),
                    Text('2024-06-14'),
                  ],
                ),
              ),
              // Percentage Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('32%',
                        style: GoogleFonts.poppins(
                            fontSize: 18, color: Colors.green)),
                    SizedBox(height: 10),
                    Text('120',
                        style: GoogleFonts.poppins(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text('2024-06-14'),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          SfCartesianChart(
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
    );
  }

}

class FabController extends GetxController {
  var isFabVisible = true.obs;

  void showFab() {
    isFabVisible.value = true;
  }

  void hideFab() {
    isFabVisible.value = false;
  }
}

class ChartData {
  final double x;
  final double y;

  ChartData(this.x, this.y);
}

class DashboardController extends GetxController {
  var selectedFilter = '1W';
  var selectedIndex = 0;

  void updateSelectedFilter(String filter) {
    selectedFilter = filter;
    update();
  }

  void onItemTapped(int index) {
    selectedIndex = index;
    update();
  }
}
