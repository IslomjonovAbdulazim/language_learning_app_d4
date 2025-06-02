import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWidget extends StatelessWidget {
  final String hint;
  final FocusNode focus;
  final TextEditingController controller;

  const TextFieldWidget({
    super.key,
    required this.hint,
    required this.focus,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focus,
      style: GoogleFonts.poppins(
        color: Color(0xff262626),
        fontSize: 16,
      ),
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Color(0xffF5F9FE),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
      ),
    );
  }
}
