import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/modules/home/views/Screen/notficationDetails_view.dart';
import 'package:pazimo/theme/themedata.dart';

class NotificationController extends GetxController {
  var generalNotifications = true.obs;
  var sound = true.obs;
  var vibrate = false.obs;
  var specialOffers = true.obs;
  var promoDiscounts = false.obs;
  var payments = false.obs;
  var cashback = true.obs;
  var appUpdates = false.obs;
  var newServiceAvailable = true.obs;
  var newTipsAvailable = false.obs;
}

class NotificationsSeting extends StatelessWidget {
  final NotificationController notificationController =
      Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary_white,
      appBar: AppBar(
         backgroundColor: primary_white,
         centerTitle: true,
        title: Text('Notifications', style: GoogleFonts.poppins( 
          color: primary_blue,
          fontSize: 24,fontWeight: FontWeight.w500
        )),
        actions: [
          InkWell(
            onTap: (){
              Get.to(()=>NotificationsScreen());
            },
            child: SvgPicture.asset("assets/svg/Bell.svg")),
          SizedBox(
            width: 21,
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          NotificationTile(
            title: 'General Notifications',
            controller: notificationController.generalNotifications,
          ),
          NotificationTile(
            title: 'Sound',
            controller: notificationController.sound,
          ),
          NotificationTile(
            title: 'Vibrate',
            controller: notificationController.vibrate,
          ),
          NotificationTile(
            title: 'Special Offers',
            controller: notificationController.specialOffers,
          ),
          NotificationTile(
            title: 'Promo & Discounts',
            controller: notificationController.promoDiscounts,
          ),
          NotificationTile(
            title: 'Payments',
            controller: notificationController.payments,
          ),
          NotificationTile(
            title: 'Cashback',
            controller: notificationController.cashback,
          ),
          NotificationTile(
            title: 'App Updates',
            controller: notificationController.appUpdates,
          ),
          NotificationTile(
            title: 'New Service Available',
            controller: notificationController.newServiceAvailable,
          ),
          NotificationTile(
            title: 'New Tips Available',
            controller: notificationController.newTipsAvailable,
          ),
        ],
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String title;
  final RxBool controller;

  NotificationTile({required this.title, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            title: Text(title, style: GoogleFonts.poppins()),
            trailing: Obx(() => CupertinoSwitch(
                  value: controller.value,
                  onChanged: (value) {
                    controller.value = value;
                  },
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(
              color: Color.fromARGB(255, 219, 217, 217),
            ),
          )
        ],
      ),
    );
  }
}
