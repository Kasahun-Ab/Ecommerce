// affiliate.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../theme/themedata.dart';

class AffiliatePage extends StatefulWidget {
  @override
  _AffiliatePageState createState() => _AffiliatePageState();
}

class _AffiliatePageState extends State<AffiliatePage> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _telegramController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _lastNameController.dispose();
    _telegramController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary_white,
      appBar: AppBar(
        backgroundColor: primary_white,
        title: Text(
          'Become an Affiliate',
          style: GoogleFonts.poppins(color: primary_blue),
        ),
        iconTheme: IconThemeData(color: primary_blue),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Tell us about you and your company',
                style: GoogleFonts.poppins(
                    fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Leave your information about your company’s details sso that we can accept you into the vendor program',
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Full Name'),
                    SizedBox(height: 5),
                    TextFormField(
                      controller: _fullNameController,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    Text('Last Name'),
                    SizedBox(height: 5),
                    TextFormField(
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    Text('Telegram Account'),
                    SizedBox(height: 5),
                    TextFormField(
                      controller: _telegramController,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Telegram account';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    Text('Email Address'),
                    SizedBox(height: 5),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email address';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        child: Text('Submit',
                            style: GoogleFonts.poppins(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary_blue,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          textStyle: GoogleFonts.poppins(fontSize: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          minimumSize:
                              Size(210, 48), // Adjust the width as needed
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
