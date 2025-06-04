import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_learning_app_d4/pages/auth/login_page.dart';
import 'package:language_learning_app_d4/widgets/text_widget.dart';
import 'package:language_learning_app_d4/widgets/textfield_widget.dart';

import '../../widgets/button_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleText("Sign Up"),
                SizedBox(height: 30),
                TextFieldWidget(
                  hint: "Name",
                  focus: FocusNode(),
                  controller: nameController,
                ),
                SizedBox(height: 10),
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
                SizedBox(height: 20),
                ButtonWidget(
                  text: "Sing Up",
                  onTap: () {
                    // Sign Up Logic ...
                  },
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
                      "Do you have an account? ",
                      style: GoogleFonts.poppins(
                        color: Color(0xff3B4054),
                        fontSize: 14,
                      ),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Get.off(LoginPage());
                      },
                      child: Text(
                        "Sign In",
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
