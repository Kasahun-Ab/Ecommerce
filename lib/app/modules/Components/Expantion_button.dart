import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpansionButton extends StatelessWidget {
  ExpansionButton(
      {super.key,
      required this.title,
      required this.description,
      this.onTap,
      this.totalReview = "",
      this.rating,
      this.name = '',
      this.dateofrating = '',
      this.buttonName = ''});
  final String title;
  final VoidCallback? onTap;
  final String? buttonName;
  final String? totalReview;
  final String description;
  final Widget? rating;
  final String? name;
  final String? dateofrating;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        backgroundColor: Colors.blue,
        collapsedBackgroundColor: Colors.blue,
        iconColor: Colors.white,
        collapsedIconColor: Colors.white,
        textColor: Colors.white,
        collapsedTextColor: Colors.white,
        title: Text(
          title,
        ),
        childrenPadding:
            const EdgeInsets.only(left: 16.0, right: 16, bottom: 10),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  totalReview == ''
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(totalReview!,
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18)),
                        ),
                  rating != null ? rating! : Container(),
                ],
              ),
              InkWell(
                onTap: onTap,
                child: Text(buttonName!),
              )
            ],
          ),
          SizedBox(height: 10),
          Text(description,
              style: GoogleFonts.poppins(
                color: Color.fromARGB(255, 221, 220, 220),
                fontSize: 16,
                fontWeight: FontWeight.w300,
              )),
          Row(
            children: [
              Text(name!,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600, color: Colors.amber)),
              SizedBox(width: 10),
              Text(dateofrating!,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600, color: Colors.white))
            ],
          )
        ]);
  }
}
