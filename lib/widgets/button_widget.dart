import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final void Function() onTap;

  const ButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: Color(0xff3461FD),
      borderRadius: BorderRadius.circular(15),
      onPressed: onTap,
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class IconButtonWidget extends StatelessWidget {
  final String text;
  final void Function() onTap;
  final String icon;

  const IconButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: Color(0xffF5F9FE),
      borderRadius: BorderRadius.circular(15),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            height: 28,
            width: 28,
          ),
          SizedBox(width: 8),
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color(0xff61677D),
            ),
          ),
        ],
      ),
    );
  }
}
