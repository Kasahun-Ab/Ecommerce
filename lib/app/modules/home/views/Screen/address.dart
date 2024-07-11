// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../api/Api_Methods/allmethodsapi.dart';
import '../../../../data/address.dart';
import 'addAdress.dart';

class AddressPage extends StatelessWidget {
  AddressPage({super.key});
  final Api _api = Api();

  deliverAddress? _address;
  var addressof = <Datum>[].obs;
  RxBool isDefault = false.obs;
  var selected = <RxBool>[].obs;

  @override
  Widget build(BuildContext context) {
    Future<void> getAddresses() async {
      try {
        final response = await _api.getAddresses();
        if (response?.data != null) {
          _address = await deliverAddress.fromJson(response!.data);
          addressof.value = _address!.data!;

          selected.value =
              addressof.map((datum) => datum.isDefault!.obs).toList();
        } else {
          _address = null;
          addressof.value = [];
        }
      } catch (e) {
        print(e.toString());
      }
    }

    // Fetch addresses initially
    getAddresses();

    void setDefaultvalue(int index) {
      for (int x = 0; x < addressof.length; x++) {
        addressof[x].isDefault = (x == index);
        selected[x].value = (x == index);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Address', style: GoogleFonts.poppins(color: Color(0xff115DB1))),
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
                  color: Color(0xff115DB1)),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: addressof.length,
                  itemBuilder: (context, index) {
                    return Obx(
                      () => Container(
                        margin: EdgeInsets.only(top: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(width: 1, color: Color(0xffE6E6E6))),
                        child: ListTile(
                          leading: SvgPicture.asset("assets/svg/Location.svg"),
                          title: Text(
                            "${addressof[index].city}",
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff115DB1)),
                          ),
                          subtitle: Text("${addressof[index].companyName}",
                              style: GoogleFonts.poppins(
                                  fontSize: 14, color: Color(0xff808080))),
                          trailing: Container(
                            height: 20,
                            width: 20,
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 1,
                                  color: Color(0xff115DB1),
                                )),
                            child: selected[index].value
                                ? Container(
                                    width: 13,
                                    height: 13,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xff115DB1)))
                                : null,
                          ),
                          onTap: () {
                            setDefaultvalue(index);
                            print(' address ${addressof[index].isDefault}');
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => NewAddressScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                textStyle: GoogleFonts.poppins(fontSize: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(color: Color(0xff115DB1), width: 2.0),
                ),
                minimumSize: Size(double.infinity, 48),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: Color(0xff115DB1),
                  ),
                  Text('Add New Address',
                      style: GoogleFonts.poppins(
                        color: Color(0xff115DB1),
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
                  backgroundColor: Color(0xff115DB1),
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                  textStyle: GoogleFonts.poppins(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: Color(0xff115DB1), width: 2.0),
                  ),
                  minimumSize: Size(double.infinity, 48),
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
