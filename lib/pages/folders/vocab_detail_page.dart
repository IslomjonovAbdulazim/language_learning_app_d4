import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VocabDetailPage extends StatefulWidget {
  const VocabDetailPage({super.key});

  @override
  State<VocabDetailPage> createState() => _VocabDetailPageState();
}

class _VocabDetailPageState extends State<VocabDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Vocab Detail",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
