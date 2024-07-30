import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CommissionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Commissions'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button action
          },
        ),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CommissionList()),
    );
  }
}

class CommissionList extends StatelessWidget {
  final CommissionController controller = Get.put(CommissionController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBarMenu(),
        SizedBox(
          height: 5,
        ),
        Expanded(
          child: Obx(
            () => ListView.builder(
              itemCount: controller.commissions.length,
              itemBuilder: (context, index) {
                var commission = controller.commissions[index];
                return CommissionItem(
                  id: commission.id,
                  title: commission.title,
                  date: commission.date,
                  amount: commission.amount,
                  imageUrl: commission.imageUrl,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class TabBarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: 'Weekly'),
              Tab(text: 'Monthly'),
              Tab(text: 'Annualy'),
            ],
          ),
        ],
      ),
    );
  }
}

class CommissionItem extends StatelessWidget {
  final String id;
  final String title;
  final String date;
  final String amount;
  final String imageUrl;

  CommissionItem({
    required this.id,
    required this.title,
    required this.date,
    required this.amount,
    required this.imageUrl,
  });
  Color secondaryBlue = Color(0xff0A4B93);
  Color primaryBlue = Color(0xff115DB1);
  Color black = Color.fromARGB(255, 0, 0, 0);
  Color _borderColor = Color(0xffE6E6E6);
  Color _greenpersent = Color(0xff0C9409);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: _borderColor)),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.network(
                      "https://staging.mytestserver.space/public/themes/shop/default/build/assets/medium-product-placeholder-3b1a7b7d.webp",
                      width: 80,
                      height: 70,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "No sleeve cloth",
                              style: GoogleFonts.poppins(
                                  color: black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text("Feb 20, 2024",
                                style: GoogleFonts.poppins(
                                    color: black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300)),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text("ETB 500",
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
  }
}

class CommissionController extends GetxController {
  var commissions = <CommissionItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCommissions();
  }

  void fetchCommissions() {
    var fetchedCommissions = [
      CommissionItemModel(
        id: '#202402220-0002322',
        title: 'Iphone 15 pro max',
        date: 'Feb 20, 2024',
        amount: 'ETB 3,500',
        imageUrl: 'https://via.placeholder.com/50', // Placeholder image URL
      ),
      CommissionItemModel(
        id: '#202402220-0002322',
        title: 'No sleeve cloth',
        date: 'Feb 20, 2024',
        amount: 'ETB 500',
        imageUrl: 'https://via.placeholder.com/50', // Placeholder image URL
      ),
    ];

    commissions.assignAll(fetchedCommissions);
  }
}

class CommissionItemModel {
  final String id;
  final String title;
  final String date;
  final String amount;
  final String imageUrl;

  CommissionItemModel({
    required this.id,
    required this.title,
    required this.date,
    required this.amount,
    required this.imageUrl,
  });
}
