import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../providers/profile_provider.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/textfield_widget.dart';

class ProfileUsernamePage extends StatefulWidget {
  final String name;

  const ProfileUsernamePage({super.key, required this.name});

  @override
  State<ProfileUsernamePage> createState() => _ProfileUsernamePageState();
}

class _ProfileUsernamePageState extends State<ProfileUsernamePage> {
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
          "Username",
          style: GoogleFonts.poppins(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextFieldWidget(
                hint: "Username",
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
                    Get.snackbar("Username is too short or long", "");
                  } else if (text == widget.name) {
                    Get.back();
                  } else {
                    isLoading = true;
                    setState(() {});
                    final res = await ProfileProvider.updateUsername(text);
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
