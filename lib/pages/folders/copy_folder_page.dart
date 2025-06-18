import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_learning_app_d4/providers/folder_provider.dart';
import 'package:language_learning_app_d4/widgets/button_widget.dart';
import 'package:language_learning_app_d4/widgets/textfield_widget.dart';

class CopyFolderPage extends StatefulWidget {
  const CopyFolderPage({super.key});

  @override
  State<CopyFolderPage> createState() => _CopyFolderPageState();
}

class _CopyFolderPageState extends State<CopyFolderPage> {
  final controller = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Copy Folder",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextFieldWidget(
                hint: "Enter Share Code",
                focus: FocusNode(),
                controller: controller,
              ),
              SizedBox(height: 10),
              isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Color(0xff3461FD),
                      ),
                    )
                  : ButtonWidget(
                      onTap: () async {
                        final code = controller.text.trim();
                        if (code.length < 5 || code.length > 7) {
                          return;
                        }
                        isLoading = true;
                        setState(() {});
                        final res = await FolderProvider.copyFolder(code);
                        isLoading = false;
                        setState(() {});
                        if (res) {
                          Navigator.pop(context);
                        }
                      },
                      text: "Copy Now",
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
