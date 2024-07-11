import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BusinessDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Business Details',
            style: GoogleFonts.poppins(color: Color(0xff115DB1))),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff115DB1),
          ),
          onPressed: () {},
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Text('Logout', style: GoogleFonts.poppins(color: Colors.red)),
                Icon(Icons.logout, color: Colors.red),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Business Name",
                  style: GoogleFonts.poppins(
                      color: Color(0xff115DB1),
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Business Name',
                    hintStyle: GoogleFonts.poppins(color: Color(0xff115DB1)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xff115DB1)),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Business Email Address",
                  style: GoogleFonts.poppins(
                      color: Color(0xff115DB1),
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Business Email Address',
                    hintStyle: GoogleFonts.poppins(color: Color(0xff115DB1)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xff115DB1)),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Business Sector",
                  style: GoogleFonts.poppins(
                      color: Color(0xff115DB1),
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5,
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText: 'Business Sector',
                    hintStyle: GoogleFonts.poppins(color: Color(0xff115DB1)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff115DB1)),
                    ),
                  ),
                  items: [
                    DropdownMenuItem(
                      value: 'Electronics',
                      child: Text('Electronics', style: GoogleFonts.poppins()),
                    ),
                  ],
                  onChanged: (value) {},
                ),
                SizedBox(height: 16),
                Text(
                  "Business Phone Number",
                  style: GoogleFonts.poppins(
                      color: Color(0xff115DB1),
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Business Phone Number',
                    hintStyle: GoogleFonts.poppins(color: Color(0xff115DB1)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xff115DB1)),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Business location",
                      style: GoogleFonts.poppins(
                          color: Color(0xff115DB1),
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "See all",
                      style: GoogleFonts.poppins(color: Color(0xff4D4D4D)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: Color(0xff115DB1),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Business location",
                            style:
                                GoogleFonts.poppins(color: Color(0xff115DB1))),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Color(0xff115DB1))),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle submit
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Color(0xff115DB1),
                    ),
                    child: Text('Submit',
                        style: GoogleFonts.poppins(color: Colors.white)),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
