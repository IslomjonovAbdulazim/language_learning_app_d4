import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/folder_model.dart';

class CreateFolderPage extends StatefulWidget {
  final FolderModel? folder;

  const CreateFolderPage({super.key, this.folder});

  @override
  State<CreateFolderPage> createState() => _CreateFolderPageState();
}

class _CreateFolderPageState extends State<CreateFolderPage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    titleController.text = widget.folder?.title ?? "";
    descriptionController.text = widget.folder?.description ?? "";
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Folder Details",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
