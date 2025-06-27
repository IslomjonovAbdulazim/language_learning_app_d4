import 'package:flutter/material.dart';
import 'package:language_learning_app_d4/models/folder_history_models.dart';
import 'package:language_learning_app_d4/providers/quiz_provider.dart';

import '../../widgets/text_widget.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  bool isLoading = false;
  FolderHistoryModel? history;

  @override
  void initState() {
    load();
    super.initState();
  }

  void load() async {
    isLoading = true;
    setState(() {});
    history = await QuizProvider.allHistory();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleText("History"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
