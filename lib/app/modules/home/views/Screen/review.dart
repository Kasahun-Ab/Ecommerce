import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/modules/Components/review_card.dart';

import '../../../../../theme/themedata.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    RxBool isOpen = true.obs;
    return Scaffold(
      backgroundColor: primary_white,
      appBar: AppBar(
        backgroundColor: primary_white,
        centerTitle: true,
        title: Text(
          "Reviews",
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: primary_blue,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "4.0",
                    style: GoogleFonts.poppins(
                        fontSize: 64.sp,
                        color: primary_blue,
                        fontWeight: FontWeight.w500),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RatingBar.builder(
                        itemSize: 30,
                        initialRating: 4,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "1034 Ratings",
                          style: GoogleFonts.poppins(
                            color: Color(
                              0xff808080,
                            ),
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              ratingwithProgressbar(size: size),
              SizedBox(
                height: 7,
              ),
              ratingwithProgressbar(size: size),
              SizedBox(
                height: 7,
              ),
              ratingwithProgressbar(size: size),
              SizedBox(
                height: 7,
              ),
              ratingwithProgressbar(size: size),
              SizedBox(
                height: 7,
              ),
              ratingwithProgressbar(size: size),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Color(0xffE6E6E6),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "45 Reviews",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: primary_blue,
                        fontSize: 16.sp),
                  ),
                  Obx(
                    () => InkWell(
                      onTap: () {
                        isOpen.value = !isOpen.value;
                      },
                      child: Row(
                        children: [
                          Text("Most Relevant",
                              style: GoogleFonts.poppins(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff808080))),
                          isOpen.value == true
                              ? Icon(Icons.navigate_next)
                              : Icon(Icons.arrow_downward),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Obx(
                () => AnimatedContainer(
                  duration: Duration(milliseconds: 2),
                  curve: Curves.bounceOut,
                  height: isOpen.value == true ? 600 : 0,
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Review_component(
                        ratingvalue: 4,
                        comment:
                            'The item is very good, my son likes it very much and plays every day.',
                        name: 'Wade Warren',
                        time: 'now',
                      ),
                      Review_component(
                        ratingvalue: 3,
                        comment:
                            'The seller is very fast in sending packet, I just bought it and the item arrived in just 1 day!',
                        name: 'Guy Hawkins',
                        time: '1 week ago',
                      ),
                      Review_component(
                        ratingvalue: 1,
                        comment:
                            'I just bought it and the stuff is really good! I highly recommend it!',
                        name: 'Robert Fox',
                        time: '2 weeks ago',
                      ),
                      Review_component(
                        ratingvalue: 5,
                        comment:
                            'The item is very good, my son likes it very much and plays every day.',
                        name: 'Kasahun ybeltal',
                        time: 'now',
                      ),
                      Review_component(
                        ratingvalue: 2,
                        comment:
                            'The item is very good, my son likes it very much and plays every day.',
                        name: 'Kasahun ybeltal',
                        time: 'now',
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Review_component extends StatelessWidget {
  Review_component({
    required this.ratingvalue,
    required this.comment,
    required this.name,
    required this.time,
    super.key,
  });
  final double ratingvalue;
  final String comment;
  final String name;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RatingBar.builder(
            itemSize: 20,
            initialRating: ratingvalue,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (double value) {},
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            comment,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Color(0xff808080)),
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Text(
                name,
                style: GoogleFonts.poppins(
                    color: primary_blue,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 5,
              ),
              Text("•"),
              SizedBox(
                width: 5,
              ),
              Text(
                time,
                style:
                    GoogleFonts.poppins(color: Color(0xff808080), fontSize: 12),
              )
            ],
          ),
        ],
      ),
    );
  }
}
