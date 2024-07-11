
import 'package:flutter/material.dart';
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
      height: 120,
      margin: EdgeInsets.only(
        bottom: 10,
        top: 10,
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.black12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(height: 100, "assets/images/tshirt.png"),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
               itemName,
                    style: GoogleFonts.poppins(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Size ${itemSize}',
                    style: GoogleFonts.poppins(
                        fontSize: 12, color: Color(0xff808080)),
                  ),
                ],
              ),
              Text(
                '\$${itemPrice}',
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0Xff333333)),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromARGB(190, 183, 216, 218),
                  ),
                  child: Center(
                    child: Text(
                      "Completed",
                      style: GoogleFonts.poppins(
                          fontSize: 10, color: Colors.green),
                    ),
                  )),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xff115DB1), borderRadius: BorderRadius.circular(7)),
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
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
