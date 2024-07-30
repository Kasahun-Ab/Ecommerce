
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderCard extends StatelessWidget {

  final String statusOfcomplate;
  final String titleofButton;
   final String itemName;
   final String itemSize;
   final String itemPrice;
   
  const OrderCard({
    Key? key,
  

    required this.statusOfcomplate,
    required this.titleofButton, 
    required this.itemName,
      this.itemSize='', 
     required this.itemPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      margin: EdgeInsets.only(
        bottom: 10,
        top: 10,
      ),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.black12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(height: 100.h, "assets/images/tshirt.png"),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                 
                    width: 120.w,
                    child: Text(
                                   "${itemName}",
                                 
                      style: GoogleFonts.poppins(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                           maxLines: 2, // Allow the text to span up to 2 lines
            overflow: TextOverflow.ellipsis, // Add ellipsis if text exceeds 2 lines
            softWrap: true, 
                    ),
                  ),
                  Text(
                    'Size ${itemSize}',
                    style: GoogleFonts.poppins(
                        fontSize: 12.sp, color: Color(0xff808080)),
                  ),
                ],
              ),
              Container(
                width: 120,
                child: Text(
                  'ETB:${itemPrice}',
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0Xff333333)),
                      maxLines: 1, // Allow the text to span up to 2 lines
           // Add ellipsis if text exceeds 2 lines
            softWrap: true, 
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.sp),
                    color: Color.fromARGB(190, 183, 216, 218),
                  ),
                  child: Center(
                    child: Text(
                      "Completed",
                      style: GoogleFonts.poppins(
                          fontSize: 10.sp, color: Colors.green),
                    ),
                  )),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xff115DB1), borderRadius: BorderRadius.circular(7)),
                padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 10.w),
                child: Center(
                    child: Text(
                  "Leave Review",
                  style: GoogleFonts.poppins(color: Colors.white),
                )),
              )
            ],
          )
        ],
      ),
    );
  }
}
