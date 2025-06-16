import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_learning_app_d4/providers/profile_provider.dart';
import 'package:language_learning_app_d4/widgets/button_widget.dart';
import 'package:language_learning_app_d4/widgets/textfield_widget.dart';

class ProfileNamePage extends StatefulWidget {
  final String name;

  const ProfileNamePage({super.key, required this.name});

  @override
  State<ProfileNamePage> createState() => _ProfileNamePageState();
}

class _ProfileNamePageState extends State<ProfileNamePage> {
  final nameController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    nameController.text = widget.name;
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
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
          "Name",
          style: GoogleFonts.poppins(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextFieldWidget(
                hint: "Name",
                focus: FocusNode(),
                controller: nameController,
              ),
              SizedBox(height: 20),
              isLoading
                  ? CircularProgressIndicator(color: Color(0xff3461FD))
                  : ButtonWidget(
                      onTap: () async {
                        final text = nameController.text.trim();
                        if (text.length < 3 || text.length > 15) {
                          Get.snackbar("Name is too short or long", "");
                        } else if (text == widget.name) {
                          Get.back();
                        } else {
                          isLoading = true;
                          setState(() {});
                          final res = await ProfileProvider.updateName(text);
                          if (res) {
                            Navigator.pop(context, text);
                          } else {
                            isLoading = false;
                            setState(() {});
                          }
                        }
                      },
                      text: "Save",
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
