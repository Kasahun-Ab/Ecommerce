import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../theme/themedata.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  String selectedCategory = 'Recent'; // Track the selected category

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary_white,
      appBar: AppBar(
        backgroundColor: primary_white,
        title: Text(
          'Orders',
          style: TextStyle(color: Color(0xff115DB1)), // Text color
        ),
        centerTitle: true, // Center align the title
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Color(0xff115DB1)), // Back arrow icon color
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back when pressed
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 10),
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
            SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceEvenly, // Center align and space evenly
              children: [
                _buildCategory('Recent', selectedCategory == 'Recent'),
                _buildCategory('Pending', selectedCategory == 'Pending'),
                _buildCategory('Finished', selectedCategory == 'Finished'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '12 results',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Reset Filter',
                  style: TextStyle(fontSize: 16, color: Color(0xff115DB1)),
                ),
              ],
            ),
            SizedBox(height: 20),
            _buildOrderContainer(
                '#202402220-0002322',
                'https://staging.mytestserver.space/public/themes/shop/default/build/assets/medium-product-placeholder-3b1a7b7d.webp',
                'Iphone 15 pro max',
                'Feb 20, 2024',
                'Pending',
                '\ETB 89,000',
                Colors.orange[100]!,
                Colors.orange),
            _buildOrderContainer(
                '#202402220-0002322',
                'https://staging.mytestserver.space/public/themes/shop/default/build/assets/medium-product-placeholder-3b1a7b7d.webp',
                'Iphone 15 pro max',
                'Feb 20, 2024',
                'Finished',
                '\ETB 89,000',
                Colors.green[200]!,
                Colors.green),
            _buildOrderContainer(
                '#20240-0002322',
                'https://staging.mytestserver.space/public/themes/shop/default/build/assets/medium-product-placeholder-3b1a7b7d.webp',
                'Iphone 15 pro max',
                'Sub Feb 20, 2024',
                'Finished',
                '\ETB 89,000',
                Colors.green[200]!,
                Colors.green),
          ],
        ),
      ),
      floatingActionButton: Container(
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
          backgroundColor: Colors.yellow,
          elevation: 0, // No elevation for the FAB itself
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.endFloat, // Position FAB at bottom right
    );
  }

  Widget _buildCategory(String text, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = text; // Update selected category
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: 12, horizontal: 20), // Added horizontal padding
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                width: isSelected ? 2.0 : 0.0,
                color: Colors.grey[400]!), // Gray underline when selected
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: isSelected ? Color(0xff115DB1) : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildOrderContainer(
      String id,
      String imagePath,
      String mainText,
      String subText,
      String status,
      String price,
      Color bgColor,
      Color textColor) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Row(
              children: [
                Text(
                  'ID',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  id,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.fromLTRB(16, 16, 16, 8), // Added top padding here
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  imagePath,
                  width: 50,
                  height: 50,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  mainText,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  subText,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4), // Adjusted padding
                            decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius:
                                  BorderRadius.circular(10), // Rounded corners
                            ),
                            child: Text(
                              status,
                              style: TextStyle(fontSize: 16, color: textColor),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40), // Increased space here
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Abebe Kebede',
                            style: TextStyle(
                                fontSize: 18, color: Colors.grey[600]),
                          ),
                          Text(
                            price,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
