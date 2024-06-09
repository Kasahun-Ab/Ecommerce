import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dash board', style: GoogleFonts.poppins()),
      ),
      body: Column(
        children: [
          // Analytics Cards
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildAnalyticsCard('ETB 40000', 'Net sales', Icons.attach_money,
                  Colors.green, '+3.2%'),
              _buildAnalyticsCard('207', 'Total Visitors', Icons.remove_red_eye,
                  Colors.blue, '+1.3%'),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildAnalyticsCard('63', 'Live Products', Icons.inventory,
                  Colors.orange, '-3.2%'),
              _buildAnalyticsCard(
                  '28', 'Completed', Icons.check_circle, Colors.green, '+5%'),
            ],
          ),
          SizedBox(height: 20),
          // Ticket Scanner
          Card(
            child: ListTile(
              leading: Icon(Icons.qr_code_scanner),
              title: Text('Ticket scanner', style: GoogleFonts.poppins()),
            ),
          ),
          SizedBox(height: 20),
          // Tickets Section
          _buildTicketsSection(),
        ],
      ),
    );
  }

  Widget _buildAnalyticsCard(String value, String title, IconData icon,
      Color iconColor, String change) {
    return Card(
      child: Container(
        width: (Get.width - 64) /
            2, // Adjust width based on screen size and padding
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: iconColor),
                SizedBox(width: 8),
                Text(value,
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 8),
            Text(title,
                style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey)),
            SizedBox(height: 8),
            Text(change,
                style: GoogleFonts.poppins(fontSize: 12, color: iconColor)),
          ],
        ),
      ),
    );
  }

  Widget _buildTicketsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Tickets',
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('New Orders', style: GoogleFonts.poppins(fontSize: 16)),
            Text('See all orders',
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.blue)),
          ],
        ),
        SizedBox(height: 10),
        // Here you can add a chart or a list of orders as shown in the image
        Text('870',
            style:
                GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold)),
        Text('26.9%',
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.green)),
        Text('23 Apr - Today',
            style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
