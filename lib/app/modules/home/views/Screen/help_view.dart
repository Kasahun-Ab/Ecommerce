import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help Center', style: GoogleFonts.poppins()),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          HelpCenterItem(
            icon: "assets/svg/hedset.svg",
            text: 'Customer Service',
          ),
          HelpCenterItem(
            icon: "assets/svg/question.svg",
            text: 'FAQ\'s',
          ),
          HelpCenterItem(
            icon: "assets/svg/whatsapp.svg",
            text: 'Whatsapp',
          ),
          HelpCenterItem(
            icon: "assets/svg/website.svg",
            text: 'Website',
          ),
          HelpCenterItem(
            icon: "assets/svg/Facebook.svg",
            text: 'Facebook',
          ),
          HelpCenterItem(
            icon: "assets/svg/twitter.svg",
            text: 'Twitter',
          ),
          HelpCenterItem(
            icon: "assets/svg/Instagram.svg",
            text: 'Instagram',
          ),
        ],
      ),
    );
  }
}

class HelpCenterItem extends StatelessWidget {
  final String icon;
  final String text;

  HelpCenterItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.blue)),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: SvgPicture.asset(icon),
        title: Text(
          text,
          style: GoogleFonts.poppins(),
        ),
      ),
    );
  }
}
