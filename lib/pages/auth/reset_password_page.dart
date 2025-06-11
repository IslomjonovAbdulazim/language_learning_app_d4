import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_learning_app_d4/models/auth_models.dart';
import 'package:language_learning_app_d4/services/network_service.dart';

import '../../widgets/button_widget.dart';
import '../../widgets/text_widget.dart';
import '../../widgets/textfield_widget.dart';
import 'login_page.dart';

class ResetPasswordPage extends StatefulWidget {
  final String email;

  const ResetPasswordPage({super.key, required this.email});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  bool isLoading = false;

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
                isLoading
                    ? CircularProgressIndicator(color: Color(0xff3461FD))
                    : ButtonWidget(
                        text: "Continue",
                        onTap: () async {
                          // Logic ...
                          final pass = passwordController.text.trim();
                          final confirm = confirmController.text.trim();
                          if (pass != confirm || pass.length < 6) return;
                          final model = ResetPasswordModel(
                            email: widget.email,
                            newPassword: pass,
                          );
                          isLoading = true;
                          setState(() {});
                          final res = await NetworkService.resetPassword(model);
                          if (res) {
                            Get.offAll(LoginPage());
                          }
                          isLoading = false;
                          setState(() {});
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
