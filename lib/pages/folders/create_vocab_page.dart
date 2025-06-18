import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateVocabPage extends StatefulWidget {
  const CreateVocabPage({super.key});

  @override
  State<CreateVocabPage> createState() => _CreateVocabPageState();
}

class _CreateVocabPageState extends State<CreateVocabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Edit Vocab",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
