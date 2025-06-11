import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_learning_app_d4/pages/home/profile_page.dart';

import '../../services/auth_service.dart';
import '../auth/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          CupertinoButton(
            onPressed: () {
              Get.to(ProfilePage());
            },
            child: Icon(
              CupertinoIcons.person,
              size: 28,
              color: Colors.black,
            ),
          ),
        ],
      ),
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
