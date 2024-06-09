import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/data/address.dart';

class Addresscont extends GetxController {
  var addresses = [
    Address('Home', '925 S Chugach St #APT 10, Alaska', true),
    Address('Office', '2438 6th Ave, Ketchikan, Alaska', false),
    Address('Apartment', '2551 Vista Dr #B301, Juneau, Alaska', false),
    Address('Parent\'s House', '4821 Ridge Top Cir, Anchorage, Alaska', false),
  ].obs;

  void setDefault(int index) {
    for (var i = 0; i < addresses.length; i++) {
      addresses[i].isDefault = i == index;
    }
    addresses.refresh();
  }
}

class AddressPage extends StatelessWidget {
  AddressPage({super.key});
  final Addresscont addressController = Get.put(Addresscont());

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address', style: GoogleFonts.poppins(color: Colors.blue)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Saved Address",
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: addressController.addresses.length,
                  itemBuilder: (context, index) {
                    var address = addressController.addresses[index];
                    return Container(
                      margin: EdgeInsets.only(top: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(width: 1, color: Color(0xffE6E6E6))),
                    
                      child: ListTile(
                        leading: SvgPicture.asset("assets/svg/Location.svg"),
                        title: Text(
                          address.title,
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue),
                        ),
                        subtitle: Text(address.address,
                            style: GoogleFonts.poppins(
                                fontSize: 14, color: Color(0xff808080))),
                        trailing: Container(
                          height: 20,
                          width: 20,
                          child: address.isDefault
                              ? Container(
                                  width: 13,
                                  height: 13,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue))
                              : null,
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 1,
                                color: Colors.blue,
                              )),
                        ),
                        onTap: () => addressController.setDefault(index),
                      ),
                    );
                  },
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Add new address action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Set background to white
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                textStyle: GoogleFonts.poppins(fontSize: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(
                      color: Colors.blue, width: 2.0), // Add blue border
                ),
                minimumSize: Size(double.infinity, 48), // Set minimum size
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.blue,
                  ),
                  Text('Add New Address',
                      style: GoogleFonts.poppins(
                        color: Colors.blue,
                      )),
                ],
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  // Add new address action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Set background to white
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                  textStyle: GoogleFonts.poppins(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(
                        color: Colors.blue, width: 2.0), // Add blue border
                  ),
                  minimumSize: Size(double.infinity, 48), // Set minimum size
                ),
                child: Text('Apply',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                    ))),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
