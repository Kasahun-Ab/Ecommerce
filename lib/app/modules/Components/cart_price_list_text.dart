
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class cart_price_text extends StatelessWidget {
  cart_price_text({
    super.key,
    required this.Sub_total,
    required this.price,
    this.color = Colors.white60,
  });

  final String Sub_total;
  final Color color;
  final RxDouble price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          Sub_total,
          style: GoogleFonts.poppins(
              fontSize: 16,
              color: Color(0Xff808080),
              fontWeight: FontWeight.w500),
        ),
        Obx(
          () => Text(
            "ETB ${price}",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500, color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
