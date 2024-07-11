import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  var selectedNickname = ''.obs;
  var fullAddress = ''.obs;
  var isDefaultAddress = false.obs;

  void setNickname(String nickname) {
    selectedNickname.value = nickname;
  }

  void setFullAddress(String address) {
    fullAddress.value = address;
  }

  void toggleDefaultAddress(bool isDefault) {
    isDefaultAddress.value = isDefault;
  }
}

class NewAddressScreen extends StatelessWidget {
  final AddressController addressController = Get.put(AddressController());
  // final Set<Marker> _markers = {
  //   Marker(
  //     markerId: MarkerId('currentLocation'),
  //     position: LatLng(37.7749, -122.4194),
  //   ),
  // };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'New Address',
          style: GoogleFonts.poppins(color: Color(0xff115DB1)),
        ),
      ),
      body: Column(
        children: [
          // Expanded(
          //   child: GoogleMap(
          //     initialCameraPosition: CameraPosition(
          //       target: LatLng(37.7749, -122.4194),
          //       zoom: 14,
          //     ),
          //     markers: _markers,
          //   ),
          // ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Address',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: const Color.fromARGB(255, 33, 65, 243),
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Obx(() => DropdownButtonFormField<String>(
                      value: addressController.selectedNickname.value.isEmpty
                          ? null
                          : addressController.selectedNickname.value,
                      onChanged: (String? newValue) {
                        addressController.setNickname(newValue!);
                      },
                      items: <String>['Home', 'Work', 'Other']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                                color: Color(0xff115DB1)), // Text color blue
                          ),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        hintText: 'Address Nickname',
                        hintStyle:
                            GoogleFonts.poppins(color: Color(0xff808080)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff115DB1)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Colors
                                  .blue), // Border color blue when focused
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      style: TextStyle(
                          color: Color(0xff115DB1),
                          fontWeight: FontWeight
                              .w600), // Apply blue color to selected item
                    )),
                SizedBox(height: 16),
                TextField(
                  style: TextStyle(
                      color: Color(0xff115DB1), fontWeight: FontWeight.w500),
                  onChanged: (value) => addressController.setFullAddress(value),
                  decoration: InputDecoration(
                    hintText: 'Full Address',
                    hintStyle: GoogleFonts.poppins(color: Color(0xff999999)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff115DB1)),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff115DB1)),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
                SizedBox(height: 16),
                Obx(() => Row(
                      children: [
                        Checkbox(
                          activeColor: Color(0xff115DB1),
                          value: addressController.isDefaultAddress.value,
                          onChanged: (bool? newValue) {
                            addressController.toggleDefaultAddress(newValue!);
                          },
                        ),
                        Text(
                          'Make this as a default address',
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Color(0xff808080),
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Handle the add address action
                    print(
                        'Address Nickname: ${addressController.selectedNickname.value}');
                    print(
                        'Full Address: ${addressController.fullAddress.value}');
                    print(
                        'Is Default: ${addressController.isDefaultAddress.value}');
                  },
                  child: Center(
                    child: Text(
                      'Add',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Color(0xff115DB1), // Background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Border radius
                    ),
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
