import 'package:flutter/material.dart';

import '../../../../../theme/themedata.dart';

class BusinessDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: primary_white,
      appBar: AppBar(
        backgroundColor: primary_white,
        title: Text(
          'Business Detail',
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.blue),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Business Name',
              style: TextStyle(color: Colors.blue),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Cody Fisher',
                labelStyle: TextStyle(color: Colors.blue),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Business Email Address',
              style: TextStyle(color: Colors.blue),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'cody.fisher45@example',
                labelStyle: TextStyle(color: Colors.blue),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Business Sector',
              style: TextStyle(color: Colors.blue),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Electronics',
                labelStyle: TextStyle(color: Colors.blue),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.keyboard_arrow_down_outlined, color: Colors.blue),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Business Phone Number',
              style: TextStyle(color: Colors.blue),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: '+1 234 453 231 506',
                labelStyle: TextStyle(color: Colors.blue),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Business Location',
              style: TextStyle(color: Colors.blue),
            ),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 90.0),
                  child: Icon(Icons.add, color: Colors.blue),
                ),
                labelText: 'Business Location',
                labelStyle: TextStyle(color: Colors.blue),
                border: OutlineInputBorder(),
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle submit action
                },
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0), // Slightly curved button
                  ),
                  textStyle: TextStyle(fontSize: 16),
                  minimumSize: Size(double.infinity, 60),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
