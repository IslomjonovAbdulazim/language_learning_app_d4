import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_learning_app_d4/pages/auth/login_page.dart';
import 'package:language_learning_app_d4/services/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CupertinoButton(
          color: Colors.red,
          onPressed: () async {
            await AuthService.logout();
            Get.offAll(LoginPage());
          },
          child: Text("Logout"),
        ),
      ),
    );
  }
}
