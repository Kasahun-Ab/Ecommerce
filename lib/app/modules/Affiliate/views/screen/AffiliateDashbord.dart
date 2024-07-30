// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AffiliateDashbord extends StatelessWidget {
  AffiliateDashbord({super.key});
  List<Map<String, dynamic>> _somedata = [
    {
      "title": 'Total Earning’s',
      "amount": '40,000',
      "present": '3.2%',
    },
    {
      "title": 'Total Paid',
      "amount": '10,000',
      "present": '3.2%',
    },
    {
      "title": 'Current Balance',
      "amount": '20,000',
      "present": '3.2%',
    }
  ];
  List<Map<String, dynamic>> _recentlyData = [
    {
      "title": 'Iphone 15 pro max',
      "amount": '40,000',
      "date": '2/4/2024',
    },
    {
      "title": 'No sleeve cloth',
      "amount": '10,000',
      "date": '2/4/2024',
    },
  ];
  Color secondaryBlue = Color(0xff0A4B93);
  Color primaryBlue = Color(0xff115DB1);
  Color black = Color.fromARGB(255, 0, 0, 0);
  Color _borderColor = Color(0xffE6E6E6);
  Color _greenpersent = Color(0xff0C9409);
  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back,
            color: primaryBlue,
          ),
          title: Text(
            'Affiliate Dashboard',
            style: GoogleFonts.poppins(
                color: primaryBlue, fontSize: 22, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 320,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _somedata.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(width: 1, color: _borderColor)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "ETB ",
                                        style: GoogleFonts.poppins(
                                            fontSize: 29,
                                            fontWeight: FontWeight.w600,
                                            color: secondaryBlue),
                                      ),
                                      Text(
                                        "${_somedata[index]['amount']}",
                                        style: GoogleFonts.poppins(
                                            fontSize: 29,
                                            fontWeight: FontWeight.w500,
                                            color: primaryBlue),
                                      )
                                    ],
                                  ),
                                  Text(
                                    '${_somedata[index]['title']}',
                                    style: GoogleFonts.poppins(
                                        color: black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.money),
                                  Text(
                                    "${_somedata[index]['present']}",
                                    style: GoogleFonts.poppins(
                                        fontSize: 16, color: _greenpersent),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                ),
                Title_with_button(black, primaryBlue, "Commissions", "See all"),
                SfCartesianChart(
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
                ),
                Title_with_button(
                    black, primaryBlue, "Recent commissions", "See all"),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 410,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _recentlyData.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(width: 1, color: _borderColor)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                color: _borderColor,
                                child: Row(
                                  children: [
                                    SizedBox(width: 10),
                                    Text("ID"),
                                    SizedBox(width: 10),
                                    Text("#202402220-0002322"),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.network(
                                          "https://staging.mytestserver.space/public/themes/shop/default/build/assets/medium-product-placeholder-3b1a7b7d.webp",
                                          width: 80,
                                          height: 70,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${_recentlyData[index]['title']}",
                                                  style: GoogleFonts.poppins(
                                                      color: black,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                    "${_recentlyData[index]['date']}",
                                                    style: GoogleFonts.poppins(
                                                        color: black,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w300)),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Text(
                                          "${_recentlyData[index]['amount']}",
                                          style: GoogleFonts.poppins(
                                              color: _greenpersent,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}

Row Title_with_button(
  Color black,
  Color primaryBlue,
  String first,
  String second,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text("${first}",
          style: GoogleFonts.poppins(
              color: black, fontSize: 20, fontWeight: FontWeight.w600)),
      GestureDetector(
        onTap: () {},
        child: Text(
          "${second}",
          style: GoogleFonts.poppins(color: primaryBlue),
        ),
      )
    ],
  );
}

class ChartData {
  final double x;
  final double y;

  ChartData(this.x, this.y);
}
