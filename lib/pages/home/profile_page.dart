import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_learning_app_d4/models/profile_models.dart';
import 'package:language_learning_app_d4/providers/profile_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileModel? profile;
  bool isLoading = false;

  @override
  void initState() {
    load();
    super.initState();
  }

  void load() async {
    isLoading = true;
    setState(() {});
    profile = await ProfileProvider.getProfile();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          CupertinoButton(
            onPressed: () {
              load();
            },
            child: Icon(
              CupertinoIcons.refresh,
              color: Color(0xff3461FD),
              size: 28,
            ),
          ),
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(color: Color(0xff3461FD)),
            )
          : profile == null
              ? Center(
                  child: Text(
                    "Error",
                    style: GoogleFonts.poppins(
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                  ),
                )
              : ListView(
                  children: [],
                ),
    );
  }
}
