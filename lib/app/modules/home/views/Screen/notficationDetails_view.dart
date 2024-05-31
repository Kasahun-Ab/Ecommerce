
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/data/notfication.dart' ;




class NotificationController extends GetxController {
  var notifications = <Notificationa>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchNotifications();
  }

  void fetchNotifications() {
    var notificationData = [
      Notificationa(
        title: '30% Special Discount!',
        description: 'Special promotion only valid today.',
        date: DateTime.now(),
        icon: 'assets/discount_icon.png',
      ),
      Notificationa(
        title: 'Top Up E-wallet Successfully!',
        description: 'You have topped up your e-wallet.',
        date: DateTime.now().subtract(Duration(days: 1)),
        icon: 'assets/wallet_icon.png',
      ),
      Notificationa(
        title: 'New Service Available!',
        description: 'Now you can track order in real-time.',
        date: DateTime.now().subtract(Duration(days: 1)),
        icon: 'assets/service_icon.png',
      ),
      Notificationa(
        title: 'Credit Card Connected!',
        description: 'Credit card has been linked.',
        date: DateTime(2023, 6, 7),
        icon: 'assets/credit_card_icon.png',
      ),
      Notificationa(
        title: 'Account Setup Successfully!',
        description: 'Your account has been created.',
        date: DateTime(2023, 6, 7),
        icon: 'assets/account_icon.png',
      ),
    ];

    notifications.addAll(notificationData);
  }

  List<Notificationa> getNotificationsByDate(DateTime date) {
    return notifications.where((notification) =>
        notification.date.year == date.year &&
        notification.date.month == date.month &&
        notification.date.day == date.day).toList();
  }

  List<DateTime> getUniqueDates() {
    return notifications.map((notification) => DateTime(
        notification.date.year,
        notification.date.month,
        notification.date.day)).toSet().toList()..sort((a, b) => b.compareTo(a));
  }
}



class NotificationsScreen extends StatelessWidget {
  final NotificationController notificationController = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications', style: GoogleFonts.poppins()),
      ),
      body: Obx(() {
        var uniqueDates = notificationController.getUniqueDates();
        return ListView.builder(
          padding: EdgeInsets.all(16.0),
          itemCount: uniqueDates.length,
          itemBuilder: (context, index) {
            var date = uniqueDates[index];
            var notifications = notificationController.getNotificationsByDate(date);
            return NotificationSection(date: date, notifications: notifications);
          },
        );
      }),
    );
  }
}

class NotificationSection extends StatelessWidget {
  final DateTime date;
  final List<Notificationa> notifications;

  NotificationSection({required this.date, required this.notifications});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          formatDate(date),
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        ...notifications.map((notification) => NotificationTile(notification: notification)).toList(),
        SizedBox(height: 16),
      ],
    );
  }

  String formatDate(DateTime date) {
    final now = DateTime.now();
    if (date.year == now.year && date.month == now.month && date.day == now.day) {
      return 'Today';
    } else if (date.year == now.year && date.month == now.month && date.day == now.day - 1) {
      return 'Yesterday';
    } else {
      return '${date.year}-${date.month}-${date.day}';
    }
  }
}

class NotificationTile extends StatelessWidget {
  final Notificationa notification;

  NotificationTile({required this.notification});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(notification.icon, width: 40, height: 40),
      title: Text(notification.title, style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
      subtitle: Text(notification.description, style: GoogleFonts.poppins()),
    );
  }
}