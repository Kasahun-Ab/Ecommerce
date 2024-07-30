import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/theme/themedata.dart';

// class myticketsDetails extends StatelessWidget {
//   const myticketsDetails({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(

//     );
//   }
// }
class myticketsDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Ticket',
          style: GoogleFonts.poppins(color: primary_blue, fontSize: 24,fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/events.jpg', // Replace with the actual image URL
              height: 350,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              'Valentine festival',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InfoRow(label: 'Name', value: 'Abebe Shemsu'),
                InfoRow(label: 'Time', value: '16 : 00 PM'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InfoRow(label: 'Date', value: '12 February 2024'),
                InfoRow(label: 'Seat', value: '245'),
              ],
            ),
            SizedBox(height: 32),
            // Container(
            //   height: 80,
            //   child: SfBarcodeGenerator(
            //     value: 'www.syncfusion.com',
            //     showValue: true,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Color(0xff808080),
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
