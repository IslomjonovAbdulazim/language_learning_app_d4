import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  final String text;
  const TitleText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w700,
        fontSize: 35,
        color: Color(0xff2A4ECA),
      ),
    );
  }
}

class BodyText extends StatelessWidget {
  final String text;
  const BodyText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        fontSize: 15,
        color: Color(0xff61677D),
      ),
    );
  }
}



