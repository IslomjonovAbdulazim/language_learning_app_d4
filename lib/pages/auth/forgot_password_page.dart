import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_learning_app_d4/models/auth_models.dart';
import 'package:language_learning_app_d4/services/network_service.dart';

import '../../widgets/button_widget.dart';
import '../../widgets/text_widget.dart';
import '../../widgets/textfield_widget.dart';
import 'verify_email_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                TitleText("Forget Password"),
                SizedBox(height: 30),
                TextFieldWidget(
                  hint: "Email",
                  focus: FocusNode(),
                  controller: emailController,
                ),
                SizedBox(height: 10),
                isLoading
                    ? CircularProgressIndicator(color: Color(0xff3461FD))
                    : ButtonWidget(
                        text: "Continue",
                        onTap: () async {
                          // Forget Password Logic...
                          final email = emailController.text.trim();
                          if (email.length < 6) return;
                          final model = ForgetPasswordModel(email: email);
                          isLoading = true;
                          setState(() {});
                          final res =
                              await NetworkService.forgotPassword(model);
                          if (res) {
                            Get.to(VerifyEmailPage(
                                isRegister: false, email: email));
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
