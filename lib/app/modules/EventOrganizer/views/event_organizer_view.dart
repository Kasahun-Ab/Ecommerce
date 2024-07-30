import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/modules/vendor/views/screen/DashboardScreen.dart';
import 'package:pazimo/theme/themedata.dart';

import '../controllers/event_organizer_controller.dart';
import 'screen/EventDashbord.dart';

class EventOrganizerView extends GetView<EventOrganizerController> {
 
  @override
 final  _selectedIndex =0.obs;
  Widget build(BuildContext context) {
    
    return Scaffold(
     backgroundColor: primary_white,
      body:  Dashbord(),
      bottomNavigationBar:BottomAppBar(
        color: primary_white,
        
            elevation: 10,
            shadowColor: primary_back,
                shape: CircularNotchedRectangle(),
                notchMargin: 6.0,
                child: Container(
                
                  height: 30.0.h,
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      itemsOfBottom(
                          0, "Overview", "assets/svg/verndor_home.svg"),
                      itemsOfBottom(
                          1, "Products", "assets/svg/verndor_product.svg"),
                      itemsOfBottom(2, "Withdraw", "assets/svg/dolar.svg"),
                      itemsOfBottom(
                          3, "Account", "assets/svg/vendor_account.svg"),
                    ],
                  ),
                )),
    );
  }
   Widget itemsOfBottom(int index, String title, String icons) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          _selectedIndex.value = index;
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              color: _selectedIndex.value == index ? Colors.blue : Colors.black,
              icons,
              width: 25,
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              title,
              style: GoogleFonts.poppins(fontSize: 13, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
