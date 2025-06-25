import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_learning_app_d4/models/quiz_models.dart';
import 'package:language_learning_app_d4/providers/quiz_provider.dart';

class QuizPage extends StatefulWidget {
  final int id;

  const QuizPage({super.key, required this.id});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final inputController = TextEditingController();
  bool isLoading = false;
  QuestionModel? question;
  AnswerResultModel? answer;

  @override
  void initState() {
    load();
    super.initState();
  }

  void load() async {
    isLoading = true;
    setState(() {});
    question = await QuizProvider.start(widget.id);
    isLoading = false;
    setState(() {});
    if (question == null) {
      Get.back();
    }
  }

  void check() async {
    final input = inputController.text.trim();
    if (input.isEmpty) return;
    isLoading = true;
    setState(() {});
    answer = await QuizProvider.answer(input, question!.quizId);
    isLoading = false;
    setState(() {});
  }

  String get q {
    if (answer != null) return answer!.nextWord ?? "No Word";
    return question?.word ?? "...";
  }

  String get count {
    if (answer != null) {
      return "${answer!.currentQuestion}/${answer!.totalQuestions}";
    } else if (question != null) {
      return "${question!.currentQuestion}/${question!.questionCount}";
    } else {
      return "...";
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop, result) {
        if (canPop) return;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            count,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
