import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_learning_app_d4/pages/auth/forgot_password_page.dart';
import 'package:language_learning_app_d4/pages/auth/register_page.dart';
import 'package:language_learning_app_d4/widgets/button_widget.dart';
import 'package:language_learning_app_d4/widgets/textfield_widget.dart';

import '../../widgets/text_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CupertinoColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleText("Login"),
                SizedBox(height: 30),
                TextFieldWidget(
                  hint: "Email",
                  focus: FocusNode(),
                  controller: emailController,
                ),
                SizedBox(height: 10),
                TextFieldWidget(
                  hint: "Password",
                  focus: FocusNode(),
                  controller: passwordController,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Spacer(),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Get.to(ForgotPasswordPage());
                      },
                      child: Text(
                        "Forgot Password",
                        style: GoogleFonts.poppins(
                          color: Color(0xff7C8BA0),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ButtonWidget(
                  text: "Log In",
                  onTap: () {},
                ),
                SizedBox(height: 10),
                IconButtonWidget(
                  text: "Google",
                  onTap: () {},
                  icon: "assets/google.png",
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Do not have an account? ",
                      style: GoogleFonts.poppins(
                        color: Color(0xff3B4054),
                        fontSize: 14,
                      ),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Get.off(RegisterPage());
                      },
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.poppins(
                          color: Color(0xff3461FD),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
