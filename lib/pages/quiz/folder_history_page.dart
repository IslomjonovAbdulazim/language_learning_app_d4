import 'package:flutter/material.dart';

class FolderHistoryPage extends StatefulWidget {
  const FolderHistoryPage({super.key});

  @override
  State<FolderHistoryPage> createState() => _FolderHistoryPageState();
}

class _FolderHistoryPageState extends State<FolderHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
        ),
      ),
    );
  }
}
