import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/auth_models.dart';
import 'reset_password_page.dart';
import '../home/home_page.dart';
import '../../services/network_service.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/text_widget.dart';
import 'package:pinput/pinput.dart';

class VerifyEmailPage extends StatefulWidget {
  final bool isRegister;
  final String email;

  const VerifyEmailPage(
      {super.key, required this.isRegister, required this.email});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  String otp = "";
  bool canSend = true;
  DateTime end = DateTime.now();
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
                TitleText("Enter OTP"),
                SizedBox(height: 30),
                Pinput(
                  length: 6,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  onCompleted: (pin) => otp = pin,
                ),
                SizedBox(height: 50),
                isLoading
                    ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(color: Color(0xff3461FD)),
                    )
                    : ButtonWidget(
                        text: widget.isRegister
                            ? "Verify Email"
                            : "Reset Password",
                        onTap: () async {
                          // Logic ...
                          if (otp.trim().length != 6) return;
                          final model = VerifyEmailModel(
                            email: widget.email,
                            otpCode: otp,
                          );
                          isLoading = true;
                          setState(() {});
                          if (widget.isRegister) {
                            final res =
                                await NetworkService.verifyRegister(model);
                            if (res) {
                              Get.offAll(HomePage());
                            }
                          } else {
                            final res =
                                await NetworkService.verifyForgot(model);
                            if (res) {
                              Get.off(ResetPasswordPage(email: widget.email));
                            }
                          }
                          isLoading = false;
                          setState(() {});
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
