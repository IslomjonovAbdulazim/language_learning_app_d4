import 'package:flutter/material.dart';

class ProfileUsernamePage extends StatefulWidget {
  final String username;
  const ProfileUsernamePage({super.key, required this.username});

  @override
  State<ProfileUsernamePage> createState() => _ProfileUsernamePageState();
}

class _ProfileUsernamePageState extends State<ProfileUsernamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
