import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoutDialogbox extends StatelessWidget {
  const LogoutDialogbox(
      {super.key,
      required this.title,
      required this.message,
      required this.onPressed,
      required this.buttontitle,
      required this.cancele,
      required this.cancletext});
  final String title;
  final String message;
  final String buttontitle;
  final VoidCallback onPressed;
  final VoidCallback cancele;
  final String cancletext;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/warning.png"),
            Text(title,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff115DB1),
                    fontSize: 17)),
            SizedBox(height: 10),
            Text(
              message,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black38),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: onPressed,
              child: Text('${buttontitle}',
                  style: GoogleFonts.poppins(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 243, 33, 33),
                padding: EdgeInsets.symmetric(vertical: 16),
                textStyle: GoogleFonts.poppins(fontSize: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                minimumSize: Size(400, 48), // Adjust the width as needed
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: cancele,
              child: Text(
                '$cancletext',
                style: GoogleFonts.poppins(color: Color(0xff115DB1)),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Text and border color
                padding: EdgeInsets.symmetric(vertical: 16),
                textStyle: GoogleFonts.poppins(fontSize: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(color: Color(0xff115DB1)), // Blue border
                ),
                minimumSize: Size(400, 48), // Adjust the width as needed
              ),
            )
          ],
        ),
      ),
    );
  }
}
