import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class searchItems extends StatelessWidget {
  const searchItems({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size.height,
        child: ListView.builder(
          itemCount: 10,
            itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                leading: Image.asset(
                    width: 56,
                    height: 53,
                    "assets/images/laptop.png"),
                title: Text("Regular Fit Slogan",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff115DB1),
                    )),
                subtitle: Text("\$ 1,190"),
                trailing: SvgPicture.asset(
                    "assets/svg/Arrow.svg"),
              ),
              SizedBox(
                height: 6,
              ),
              Divider()
            ],
          );
        }));
  }
}
