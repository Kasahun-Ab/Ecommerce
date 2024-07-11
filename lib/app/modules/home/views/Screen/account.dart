// import 'package:flutter/material.dart';

// // import 'delivery-addresses.dart';
// // import 'helpcenter.dart';
// import 'mydetails.dart';
// import 'myorders.dart';
// import 'mytickets.dart';
// // import 'notifications.dart'; // Import your HelpCenterPage

// class AccountPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(






//       appBar: AppBar(
//         title: Text(
//           'Account',
//           style: TextStyle(color: Color(0xff115DB1)), // Setting text color to blue
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(
//               Icons.qr_code_scanner,
//               color: Color(0xff115DB1), // Setting icon color to blue
//             ),
//             onPressed: () {
//               // Add onPressed action here
//             },
//           ),
//         ],
//         iconTheme: IconThemeData(color: Color(0xff115DB1)), // Setting icon theme color to blue
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Expanded(
//               child: ListView(
//                 children: <Widget>[
//                   _buildListItem(Icons.shopping_bag, 'My Orders', () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => MyOrdersPage()),
//                     );
//                   }),
//                   _buildListItem(Icons.event_seat, 'My Tickets', () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => MyTicketsPage()),
//                     );
//                   }),
//                   _buildListItem(Icons.person, 'My Details', () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => MyDetailsPage()),
//                     );
//                   }),
//                   _buildListItem(Icons.location_on, 'Delivery Addresses', () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => DeliveryAddressesPage()),
//                     );
//                   }),
//                   _buildListItem(Icons.notifications, 'Notifications', () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => NotificationsPage()),
//                     );
//                   }),
//                   _buildListItem(Icons.help, 'Help Center', () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => HelpCenterPage()),
//                     );
//                   }),
//                   SizedBox(height: 206),
//                   Divider(
//                     height: 1.0,
//                     color: Colors.grey,
//                   ),
//                   _buildSpecialListItem('Become a Vendor'),
//                   _buildSpecialListItem('Become an Affiliate')
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildListItem(IconData icon, String title, VoidCallback onPressed) {
//     return Column(
//       children: <Widget>[
//         ListTile(
//           onTap: onPressed,
//           leading: Icon(
//             icon,
//             color: Color(0xff115DB1),
//           ),
//           title: Text(title),
//           trailing: Icon(
//             Icons.keyboard_arrow_right,
//             color: Color(0xff115DB1), // Set arrow icon color to blue
//           ),
//         ),
//         Divider(
//           height: 1.0,
//           color: Colors.grey,
//         ),
//       ],
//     );
//   }

//   Widget _buildSpecialListItem(String title) {
//     return Column(
//       children: <Widget>[
//         ListTile(
//           title: Text(
//             title,
//             style: TextStyle(color: Color(0xff115DB1)),
//           ),
//           trailing: Icon(
//             Icons.keyboard_arrow_right,
//             color: Color(0xff115DB1), // Set arrow icon color to blue
//           ),
//         ),
//         Divider(
//           height: 1.0,
//           color: Colors.grey,
//         ),
//       ],
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: AccountPage(),
//   ));
// }
