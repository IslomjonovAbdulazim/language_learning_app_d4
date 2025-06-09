import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_learning_app_d4/pages/auth/reset_password_page.dart';
import 'package:language_learning_app_d4/widgets/button_widget.dart';
import 'package:language_learning_app_d4/widgets/text_widget.dart';
import 'package:pinput/pinput.dart';

import 'login_page.dart';

class VerifyEmailPage extends StatefulWidget {
  final bool isRegister;
  final String email;

  const VerifyEmailPage({super.key, required this.isRegister, required this.email});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  String otp = "";
  bool canSend = true;
  DateTime end = DateTime.now();

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
                TitleText("Enter OTP"),
                SizedBox(height: 30),
                Pinput(
                  length: 6,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  onCompleted: (pin) => otp = pin,
                ),
                SizedBox(height: 50),
                ButtonWidget(
                  text: widget.isRegister ? "Verify Email" : "Reset Password",
                  onTap: () {
                    // Logic ...

                  },
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Did not get OTP? ",
                      style: GoogleFonts.poppins(
                        color: Color(0xff3B4054),
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(width: 2),
                    canSend
                        ? CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              end = DateTime.now().add(Duration(minutes: 1));
                              canSend = false;
                              setState(() {});
                              // Resend Logic ...
                            },
                            child: Text(
                              "Resend OTP",
                              style: GoogleFonts.poppins(
                                color: Color(0xff3461FD),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        : TimerCountdown(
                            format: CountDownTimerFormat.secondsOnly,
                            enableDescriptions: false,
                            timeTextStyle: GoogleFonts.poppins(
                              color: Color(0xff3461FD),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            endTime: end,
                            onEnd: () {
                              canSend = true;
                              setState(() {});
                            },
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
