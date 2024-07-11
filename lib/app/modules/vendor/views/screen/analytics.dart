import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'orders.dart';
// import 'orders.dart';
// Import your orders.dart page

class AnalyticsPage extends StatefulWidget {
  @override
  _AnalyticsPageState createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  String selectedFilter = '1W'; // Track the selected filter

  Widget _buildTimeFilter(String text) {
    bool isSelected =
        selectedFilter == text; // Check if this filter is selected
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = text; // Update selected filter
        });
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
          style: TextStyle(color: isSelected ? Colors.white : Colors.black),
        ),
      ),
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // New Orders Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    Center(
                        child:
                            Text('New Orders', style: TextStyle(fontSize: 18))),
                    SizedBox(height: 10),
                    Text('870',
                        style: TextStyle(
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
                    SizedBox(height: 10),
                    Text('32%',
                        style: TextStyle(fontSize: 18, color: Colors.green)),
                    SizedBox(height: 10),
                    Text('120',
                        style: TextStyle(
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
            primaryXAxis: NumericAxis(),
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

  Widget _buildCard(
      String mainText, String subText, String percentage, IconData icon) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mainText,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff115DB1)),
              ),
              SizedBox(height: 5),
              Text(subText,
                  style: TextStyle(fontSize: 14, color: Colors.black)),
            ],
          ),
          Column(
            children: [
              Icon(icon, size: 30, color: Color(0xff115DB1)),
              SizedBox(height: 5),
              Text(percentage,
                  style: TextStyle(fontSize: 16, color: Colors.green)),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Analytics',
          style: TextStyle(color: Color(0xff115DB1)), // Text color
        ),
        centerTitle: true, // Center align the title
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => OrdersPage()),
                // );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Orders',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(OrdersPage());
                    },
                    child: Text(
                      'See all orders',
                      style: TextStyle(fontSize: 16, color: Color(0xff115DB1)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
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
            _buildOrderDetailsContainer(),
            SizedBox(height: 10),
            _buildCard(
                'ETB 40,000 ', 'Total Earnings', '3.2%', Icons.attach_money),
            _buildCard('ETB 10,000 ', 'Total Paid', '3.2%', Icons.people),
            _buildCard(
                'ETB 30,000 ', 'Current Balance', '3.2%', Icons.trending_up),
          ],
        ),
      ),
    );
  }
}

class ChartData {
  final double x;
  final double y;

  ChartData(this.x, this.y);
}
