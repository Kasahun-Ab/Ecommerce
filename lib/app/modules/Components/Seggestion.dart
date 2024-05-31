
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class seggestion extends StatelessWidget {
  const seggestion({
    super.key,
    required this.suggestion,
  });

  final List suggestion;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recent Searches",
                style: GoogleFonts.poppins(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "Clear all",
                style:
                    GoogleFonts.poppins(color: Colors.blue),
              ),
            ],
          ),
          Container(
            height: 600,
            child: ListView.builder(
                itemCount: suggestion.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 13,
                      ),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            suggestion[index],
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.blue,
                                fontWeight:
                                    FontWeight.normal),
                          ),
                          SvgPicture.asset(
                              "assets/svg/Cancel-circle.svg")
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Divider()
                    ],
                  );
                }),
          )
        ],
      );
  }
}
