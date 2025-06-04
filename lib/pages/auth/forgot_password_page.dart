import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_learning_app_d4/pages/auth/verify_email_page.dart';
import 'package:language_learning_app_d4/widgets/button_widget.dart';
import 'package:language_learning_app_d4/widgets/text_widget.dart';
import 'package:language_learning_app_d4/widgets/textfield_widget.dart';

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
                ButtonWidget(
                  text: "Continue",
                  onTap: () {
                    // Forget Password Logic...

                    Get.to(VerifyEmailPage(isRegister: false));
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
