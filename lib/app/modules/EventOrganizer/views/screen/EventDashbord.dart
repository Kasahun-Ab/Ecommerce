import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/theme/themedata.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../Affiliate/views/screen/AffiliateDashbord.dart';

class Dashbord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary_white,
      appBar: AppBar(
        surfaceTintColor: primary_white,
        scrolledUnderElevation: 1.2,
        shadowColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 1,
        backgroundColor: primary_white,
        title: Text(
          'Dashbord',
          style: GoogleFonts.poppins(
              fontSize: 24, color: primary_blue, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Analytics",
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward,
                      color: primary_blue,
                    ))
              ],
            ),
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
            Text(
              "Scan your tickets here",
              style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: Color(0xff4D4D4D),
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 10),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary_white,
                  shadowColor: Colors.black, // shadow color
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // border radius
                  ),
                ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ticket \nscanner",
                        style: GoogleFonts.poppins(
                          color: primary_back,
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                      Image.asset("assets/images/scanner 2.png")
                    ],
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tickets",
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  "See all Scans",
                  style: GoogleFonts.poppins(color: primary_blue),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTimeFilter('1W'),
                _buildTimeFilter('4W'),
                _buildTimeFilter('1Y'),
                _buildTimeFilter('MTD'),
                _buildTimeFilter('QTD'),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: _buildOrderDetailsContainer(),
            ),
            SizedBox(
              child: Container(
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
            )
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

  Widget _buildTimeFilter(String data) {
    return Container(
        color: Colors.black12,
        padding: EdgeInsets.all(5),
        child: Center(
          child: Text(data),
        ));
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
          // Get.to(ProductsPage());
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
}
