import 'package:flutter/material.dart';

class ProfileBioPage extends StatefulWidget {
  final String bio;
  const ProfileBioPage({super.key, required this.bio});

  @override
  State<ProfileBioPage> createState() => _ProfileBioPageState();
}

class _ProfileBioPageState extends State<ProfileBioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
