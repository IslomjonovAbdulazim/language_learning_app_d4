import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_learning_app_d4/widgets/button_widget.dart';
import 'package:language_learning_app_d4/widgets/textfield_widget.dart';

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFieldWidget(
                  hint: "Email",
                  focus: FocusNode(),
                  controller: emailController,
                ),
                SizedBox(height: 10),
                TextFieldWidget(
                  hint: "Password",
                  focus: FocusNode(),
                  controller: emailController,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Spacer(),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
