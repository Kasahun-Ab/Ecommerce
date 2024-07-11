import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/modules/home/views/Screen/affiliate.dart';
import 'package:pazimo/app/modules/home/views/Screen/vendor.dart';

// ignore: must_be_immutable
class ConditionsPage extends StatelessWidget {
  String title;
  bool fromregister;
  ConditionsPage({this.title = '', this.fromregister = false});

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Terms of use',
            style: GoogleFonts.poppins(
                color: Color(0xff115DB1)), // Setting text color to blue
          ),
          iconTheme: IconThemeData(
              color: Color(0xff115DB1)), // Setting icon theme color to blue
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.all(16.0),
                  margin: EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    'Selam, \n'
                    'Before you become a vendor, please read and accept Terms and Conditions',
                    style:
                        GoogleFonts.poppins(fontSize: 16, color: Colors.black),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  margin: EdgeInsets.only(bottom: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Image.asset(
                          //   'assets/images/logo.jpg', // Replace with your image asset path
                          //   width: 64,
                          //   height: 64,
                          // ),
                          SizedBox(width: 16.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Terms and Conditions',
                                style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                'Last updated: Yesterday',
                                style: GoogleFonts.poppins(
                                    fontSize: 16, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        '1. Introduction\n'
                        ' This Vendor Agreement ("Agreement") is entered into by and between Pazimo, a pioneering E-commerce platform offering affiliate marketing in Ethiopia ("Pazimo" or "Company"), and the undersigned vendor ("Vendor"). This Agreement outlines the terms and conditions under which Vendor will offer products for sale on Pazimo’s platform.',
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        '2. Agreement Terms\n'
                        '2.1 Commission and Pricing'
                        'Pazimo will apply a commission fee of 10% on the cost of each product sold through its platform. This commission will be added to the product’s listed price, thus the final selling price will include this fee.',
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        '2.2 Facilitation and Delivery\n'
                        'Pazimo will be responsible for facilitating all aspects of the transaction, including marketing, sales, customer service, and delivery of products to customers. Pazimo commits to providing a smooth and efficient process to enhance customer and vendor satisfaction.',
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        '2.3 Returns and Guarantees\n'
                        'Pazimo offers a money-back guarantee for all products sold on its platform. If a product is found to be defective or not as described, the customer is entitled to a replacement or a full refund. The Vendor is required to either replace the defective product or refund Pazimo within 24 hours of the claim. The cost incurred for returns or replacements due to defective products will be borne by the Vendor.',
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        '2.4 Financial Transactions\n'
                        'All financial transactions from sales will be processed and held within the Pazimo Vendor Dashboard. Vendors will have the ability to monitor their sales and balance in real time. Funds can be requested at any time from the dashboard, and Pazimo will process these requests within 24 hours.',
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        '2.5 Vendor Verification\n'
                        'A Vendor will be verified on the Pazimo platform upon successful delivery and customer acceptance of at least 10 products without any returns or customer complaints. Verification will enhance the Vendor’s visibility and reputation on the platform.',
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        '3. Obligations of the Vendor\n'
                        '3.1 Product Quality\n'
                        'Vendors must ensure that all products listed on the Pazimo platform are of high quality, fully functional, and accurately described.',
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        '3.2 Legal Compliance\n'
                        'Vendors agree to comply with all local and international laws applicable to their business and the products they offer on the Pazimo platform.',
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                      SizedBox(height: 16.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: fromregister == false
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 150.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[500], // Background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        onPressed: () {
                          // Handle "Disagree" button press
                        },
                        child: Text(
                          'Disagree',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff115DB1), // Background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        onPressed: () {
                          if (title == "vendor") {
                            Get.to(() => VendorPage());
                          } else {
                            Get.to(() => AffiliatePage());
                          }
                        },
                        child: Text(
                          'Agree',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                height: 16,
              ));
  }
}
