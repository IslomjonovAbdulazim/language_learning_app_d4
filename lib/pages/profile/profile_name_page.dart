import 'package:flutter/material.dart';

class ProfileNamePage extends StatefulWidget {
  final String name;

  const ProfileNamePage({super.key, required this.name});

  @override
  State<ProfileNamePage> createState() => _ProfileNamePageState();
}

class _ProfileNamePageState extends State<ProfileNamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
