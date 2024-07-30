import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/modules/Components/CardTitle_with%20Icon.dart';
import 'package:pazimo/app/modules/Components/search_textfield.dart';
import 'package:pazimo/app/modules/home/views/Screen/event_detailes_view.dart';

class EventView extends StatelessWidget {
  EventView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(235, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(235, 255, 255, 255),
        title: search(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Container(
            height: 890.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        
                        /////////////////////////////////
                          CardTitle_with_icon(
                            title: 'Event’s this month',
                            subtitle: "Event’s happening this month",
                            tap: () {}, iconshow: false,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Container(
                          height: 270.h,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              EventCard(
                                imagePath: "assets/images/event1.jpg",
                                location: "Sheraton Addis",
                                description: "Valentine day",
                                price: 20.0,
                                canceledPrice: 30.0,
                              ),
                              EventCard(
                                imagePath: "assets/images/event2.png",
                                location: "Terara Hike’s",
                                description: "Hiking Event",
                                price: 25.0,
                                canceledPrice: 35.0,
                              ),
                              EventCard(
                                imagePath: "assets/images/events.jpg",
                                location: "Valentine Festival",
                                description: "Sami cafe",
                                price: 15.0,
                                canceledPrice: 25.0,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                       
                        /////////////////////////////////
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: CardTitle_with_icon(
                              title: "Upcoming events", tap: () {}, iconshow: false,),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            children: [
                              SmallEventCard(
                                imagePath: "assets/images/event1.jpg",
                                eventName: "Art Exhibition",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SmallEventCard(
                                imagePath: "assets/images/event2.png",
                                eventName: "Music Concert",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SmallEventCard(
                                imagePath: "assets/images/events.jpg",
                                eventName: "Food Festival",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  EventCard({
    required this.imagePath,
    required this.location,
    required this.description,
    required this.price,
    required this.canceledPrice,
  });

  final double canceledPrice;
  final String description;
  final String imagePath;
  final String location;
  final double price;

  @override
  Widget build(BuildContext context) {
    Rx isliked = false.obs;
    return Obx(
      () => Card(
        color: Colors.white, // Set card color to white

        margin: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        child: SizedBox(
          width: 161.w,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.asset(
                  imagePath,
                  height: 174.h,
                  width: 161.w,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  top: 12.h,
                  right: 12.w,
                  child: InkWell(
                    radius: 20.r,
                    onTap: () {
                      isliked.value = !isliked.value;
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: isliked.value == true
                            ? SvgPicture.asset(
                                width: 20.h,
                                height: 20.w,
                                "assets/svg/liked.svg")
                            : SvgPicture.asset(
                                width: 20.h,
                                height: 20.w,
                                "assets/svg/like.svg"),
                      ),
                    ),
                  )),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        location,
                        style: GoogleFonts.poppins(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        description,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Text(
                            '\$$price',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff4D4D4D),
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            '\$$canceledPrice',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Color(0xffB3B3B3),
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SmallEventCard extends StatelessWidget {
  SmallEventCard({
    required this.imagePath,
    required this.eventName,
  });

  final String eventName;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to event detail page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetailPage(eventName: eventName),
          ),
        );
      },
      child: Card(
        elevation: 4,
        margin: EdgeInsets.symmetric(
          vertical: 0,
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                color: Color(0xffE6E6E6),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      imagePath,
                      width: 72.18.w,
                      height: 80.43.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          eventName,
                          style: GoogleFonts.poppins(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                                width: 20, "assets/svg/Location-filled.svg"),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Sheraton Addis",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xFF4D4D4D)),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 100.w,
                                  height: 50,
                                ),
                                Positioned(
                                    width: 50.w,
                                    top: 0,
                                    left: 0,
                                    child: Image.asset(
                                        "assets/images/person2.png")),
                                Positioned(
                                    width: 50.w,
                                    top: 0,
                                    left: 10,
                                    child: Image.asset(
                                        "assets/images/person3.png")),
                                Positioned(
                                    top: 0,
                                    left: 20,
                                    child: Image.asset(
                                        width: 50.w,
                                        "assets/images/person4.png")),
                                Positioned(
                                    top: 0,
                                    left: 30,
                                    child: Image.asset(
                                        width: 50.w,
                                        "assets/images/person5.png")),
                                Positioned(
                                    top: 0,
                                    left: 40,
                                    child: Image.asset(
                                        width: 50.w,
                                        "assets/images/person1.png")),
                              ],
                            ),
                            Text(
                              "1000+",
                              style: GoogleFonts.poppins(
                                  color: Color(0xff115DB1),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Joined",
                              style: GoogleFonts.poppins(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 43.31,
                  width: 29.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "Feb",
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Color(0xff115DB1),
                              fontWeight: FontWeight.bold),
                        ),
                        Text("12",
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colors.amber,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class EventDetailPage extends StatelessWidget {
//   EventDetailPage({required this.eventName});

//   final String eventName;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(eventName),
//       ),
//       body: Center(
//         child: Text('Details of $eventName'),
//       ),
//     );
//   }
// }
