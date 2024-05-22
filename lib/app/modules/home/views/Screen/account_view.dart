import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pazimo/app/modules/home/views/Screen/myorders.dart';
import 'package:pazimo/app/modules/home/views/Screen/mytickets.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Add your onPressed code here!
          },
        ),
        actions: [
          SvgPicture.asset(color: Colors.black, "assets/svg/scanner.svg"),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: ListView(
        children: [
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
              Get.to(MyTicketsPage());
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
              // Add your onTap code here!
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
              // Add your onTap code here!
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
              // Add your onTap code here!
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
              // Add your onTap code here!
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
              // Add your onTap code here!
            },
            trailing: Icon(
              Icons.navigate_next,
              color: Color(0Xffb3b3b3),
            ),
          ),
          ListTile(
            title: Text('Become an affiliate'),
            onTap: () {
              // Add your onTap code here!
            },
            trailing: Icon(
              Icons.navigate_next,
              color: Color(0Xffb3b3b3),
            ),
          ),
        ],
      ),
    );
  }
}
