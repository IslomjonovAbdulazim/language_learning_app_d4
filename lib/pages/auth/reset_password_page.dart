import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_learning_app_d4/pages/auth/login_page.dart';
import 'package:language_learning_app_d4/widgets/button_widget.dart';
import 'package:language_learning_app_d4/widgets/text_widget.dart';
import 'package:language_learning_app_d4/widgets/textfield_widget.dart';

class ResetPasswordPage extends StatefulWidget {
  final String email;
  const ResetPasswordPage({super.key, required this.email});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleText("Reset Password"),
                SizedBox(height: 30),
                TextFieldWidget(
                  hint: "New Password",
                  focus: FocusNode(),
                  controller: passwordController,
                ),
                SizedBox(height: 10),
                TextFieldWidget(
                  hint: "Confirm Password",
                  focus: FocusNode(),
                  controller: confirmController,
                ),
                SizedBox(height: 30),
                ButtonWidget(
                  text: "Continue",
                  onTap: () {
                    // Logic ...
                    Get.offAll(LoginPage());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
