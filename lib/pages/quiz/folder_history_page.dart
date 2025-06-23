import 'package:flutter/material.dart';
import 'package:language_learning_app_d4/widgets/text_widget.dart';

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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleText("Folder History"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
