import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/api/Api_Methods/allmethodsapi.dart';
import 'package:pazimo/app/modules/home/controllers/home_controller.dart';
import 'package:pazimo/app/modules/home/views/Screen/address.dart';
import 'package:pazimo/app/modules/home/views/Screen/conditions.dart';
import 'package:pazimo/app/modules/home/views/Screen/help_view.dart';
import 'package:pazimo/app/modules/home/views/Screen/mydetails.dart';
import 'package:pazimo/app/modules/home/views/Screen/myorders.dart';
import 'package:pazimo/app/modules/home/views/Screen/mytickets.dart';
import 'package:pazimo/app/modules/home/views/Screen/notficationSetings.dart';

import '../../../Components/logoutDialog.dart';
import 'saved_items_view.dart';

class AccountScreen extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Account'),
          leading: Container(),
          actions: [
            // ignore: deprecated_member_use
            SvgPicture.asset(color: Colors.black, "assets/svg/scanner.svg"),
            SizedBox(
              width: 20,
            )
          ],
        ),
        body: ListView(
          children: [
            ListTile(
                leading: SvgPicture.asset("assets/svg/liked.svg"),
                title: Text('Wishlists'),
                onTap: () {
                  Get.to(() => SavedItemsPage());
                },
                trailing: controller.wishlist.value.data.length == 0
                    ? Icon(
                        Icons.navigate_next,
                        color: Color(0Xffb3b3b3),
                      )
                    : Obx(
                        () => CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.red,
                          child: Text(
                            "${controller.wishlist.value.data.length} ",
                            style: TextStyle(fontSize: 13, color: Colors.white),
                          ),
                        ),
                      )),
            ListTile(
              leading: SvgPicture.asset("assets/svg/orders.svg"),
              title: Text('My Orders'),
              onTap: () {
                Get.to(() => MyOrdersPage());
              },
              trailing: Icon(
                Icons.navigate_next,
                color: Color(0Xffb3b3b3),
              ),
            ),
            ListTile(
              leading: SvgPicture.asset("assets/svg/tickets.svg"),
              title: Text('My Tickets'),
              onTap: () {
                Get.to(() => MyTicketsPage());
              },
              trailing: Icon(
                Icons.navigate_next,
                color: Color(0Xffb3b3b3),
              ),
            ),
            ListTile(
              leading: SvgPicture.asset("assets/svg/details.svg"),
              title: Text('My Details'),
              onTap: () {
                Get.to(() => MyDetailsPage());
              },
              trailing: Icon(
                Icons.navigate_next,
                color: Color(0Xffb3b3b3),
              ),
            ),
            ListTile(
              leading: SvgPicture.asset("assets/svg/adress.svg"),
              title: Text('Delivery Addresses'),
              onTap: () {
                Get.to(() => AddressPage());
              },
              trailing: Icon(
                Icons.navigate_next,
                color: Color(0Xffb3b3b3),
              ),
            ),
            ListTile(
              leading: SvgPicture.asset("assets/svg/Bell.svg"),
              title: Text('Notifications'),
              onTap: () {
                Get.to(() => NotificationsSeting());
              },
              trailing: Icon(
                Icons.navigate_next,
                color: Color(0Xffb3b3b3),
              ),
            ),
            ListTile(
              leading: SvgPicture.asset("assets/svg/Bell.svg"),
              title: Text('Help Center'),
              onTap: () {
                Get.to(() => HelpCenter());
              },
              trailing: Icon(
                Icons.navigate_next,
                color: Color(0Xffb3b3b3),
              ),
            ),
            Divider(),
            ListTile(
              title: Text('Become a vendor'),
              onTap: () {
                Get.to(() => ConditionsPage(
                      title: 'vendor',
                    ));
              },
              trailing: Icon(
                Icons.navigate_next,
                color: Color(0Xffb3b3b3),
              ),
            ),
            ListTile(
              title: Text('Become an affiliate'),
              onTap: () {
                Get.to(() => ConditionsPage(
                      title: 'affiliate',
                    ));
              },
              trailing: Icon(
                Icons.navigate_next,
                color: Color(0Xffb3b3b3),
              ),
            ),
            ListTile(
              leading: SvgPicture.asset(
                  // ignore: deprecated_member_use
                  color: Colors.red,
                  width: 20,
                  'assets/svg/logout-svgrepo-com.svg'),
              title: Text(
                'Logout',
                style: GoogleFonts.poppins(color: Colors.red),
              ),
              onTap: () {
                Get.dialog((LogoutDialogbox(
                  title: 'Logout?',
                  message: 'Are you sure you want to logout?',
                  onPressed: () {
                    Api().logout(controller);
                  },
                  buttontitle: 'Logout',
                  cancele: () {
                    Get.back();
                  },
                  cancletext: 'No Cancel',
                )));
              },
              trailing: Icon(
                Icons.navigate_next,
                color: Color(0Xffb3b3b3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
