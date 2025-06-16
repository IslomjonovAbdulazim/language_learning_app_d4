import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_learning_app_d4/providers/folder_provider.dart';
import 'package:language_learning_app_d4/widgets/button_widget.dart';
import 'package:language_learning_app_d4/widgets/textfield_widget.dart';

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
          child: Center(
            child: Column(
              children: [
                TextFieldWidget(
                  hint: "Title",
                  focus: FocusNode(),
                  controller: titleController,
                ),
                SizedBox(height: 10),
                TextFieldWidget(
                  hint: "Description",
                  focus: FocusNode(),
                  controller: descriptionController,
                ),
                SizedBox(height: 20),
                isLoading
                    ? CircularProgressIndicator(color: Color(0xff3461FD))
                    : ButtonWidget(
                        onTap: () async {
                          final title = titleController.text.trim();
                          final desc = descriptionController.text.trim();
                          if (title.length < 3 ||
                              desc.length < 5 ||
                              title.length > 40 ||
                              desc.length > 120) {
                            Get.closeAllSnackbars();
                            Get.snackbar(
                              "Wrongs Lengths",
                              "Title (3:40), Description (5:120)",
                              colorText: Colors.red.shade700,
                            );
                          } else {
                            isLoading = true;
                            setState(() {});
                            final model = FolderModel(
                              id: widget.folder?.id ?? -1,
                              title: title,
                              description: desc,
                            );
                            if (widget.folder == null) {
                              await FolderProvider.createFolder(model);
                            } else {
                              await FolderProvider.updateFolder(model);
                            }
                            Get.back();
                            isLoading = false;
                            setState(() {});
                          }
                        },
                        text: "Save",
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
