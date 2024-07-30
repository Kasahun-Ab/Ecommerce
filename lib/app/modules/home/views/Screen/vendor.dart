// vendor.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../theme/themedata.dart';

class VendorPage extends StatefulWidget {
  @override
  _VendorPageState createState() => _VendorPageState();
}

class _VendorPageState extends State<VendorPage> {
  final _formKey = GlobalKey<FormState>();
  final _businessNameController = TextEditingController();
  final _workEmailController = TextEditingController();
  final _workPhoneNumberController = TextEditingController();
  String? _selectedSector;

  final List<String> _sectors = [
    'Retail',
    'Wholesale',
    'Manufacturing',
    'Services',
    'Technology',
  ];

  @override
  void dispose() {
    _businessNameController.dispose();
    _workEmailController.dispose();
    _workPhoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Become a Vendor',
          style: GoogleFonts.poppins(color: primary_blue),
        ),
        iconTheme: IconThemeData(color: primary_blue),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Tell us more about you and what you do',
                  style: GoogleFonts.poppins(
                      fontSize: 22.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Leave your information about your company’s details so that we can accept you into the vendor program',
                  style: GoogleFonts.poppins(fontSize: 14.sp, color: Colors.grey),
                ),
                SizedBox(height: 10),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Business Name'),
                      SizedBox(height: 5),
                      TextFormField(
                        controller: _businessNameController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your business name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Text('Company Sector'),
                      SizedBox(height: 5),
                      DropdownButtonFormField<String>(
                        value: _selectedSector,
                        hint: Text('Select Company Sector'),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedSector = newValue;
                          });
                        },
                        items: _sectors.map((sector) {
                          return DropdownMenuItem(
                            value: sector,
                            child: Text(sector),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select your company sector';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Text('Work Email'),
                      SizedBox(height: 5),
                      TextFormField(
                        controller: _workEmailController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your work email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Text('Work Phone Number'),
                      SizedBox(height: 5),
                      TextFormField(
                        controller: _workPhoneNumberController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your work phone number';
                          }
                          if (!RegExp(r'^\+?[0-9]{7,15}$').hasMatch(value)) {
                            return 'Please enter a valid phone number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Text('Business Location'),
                      SizedBox(height: 5),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Handle business location action
                        },
                        icon: Icon(Icons.add, color: primary_blue),
                        label: Text(
                          'Business Location',
                          style: GoogleFonts.poppins(color: primary_blue),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(color: primary_blue),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.sp, horizontal: 10.sp),
                          textStyle: GoogleFonts.poppins(fontSize: 16.sp),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0.sp),
                          ),
                          minimumSize: Size(double.infinity,
                              48), // Set the height to match the input fields
                        ),
                      ),
                      SizedBox(height: 20),
                      Text('Trade Licence'),
                      SizedBox(height: 5),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Handle trade license action
                        },
                        icon: Icon(Icons.add, color: primary_blue),
                        label: Text(
                          'Trade Licence',
                          style: GoogleFonts.poppins(color: primary_blue),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(color: primary_blue),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          textStyle: GoogleFonts.poppins(fontSize: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          minimumSize: Size(double.infinity,
                              48), // Set the height to match the input fields
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Handle form submission
                          }
                        },
                        child: Text('Submit',
                            style: GoogleFonts.poppins(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[700],
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          textStyle: GoogleFonts.poppins(fontSize: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          minimumSize: Size(double.infinity,
                              48), // Set the height to match the input fields
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
