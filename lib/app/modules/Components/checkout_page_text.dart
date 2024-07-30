
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/theme/themedata.dart';

class checkout_page_text extends StatelessWidget {
  const checkout_page_text({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.poppins(
          fontSize: 17,
          color: primary_blue,
          fontWeight: FontWeight.w600),
    );
  }
}
