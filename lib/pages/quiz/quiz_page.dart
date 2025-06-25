import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_learning_app_d4/models/quiz_models.dart';
import 'package:language_learning_app_d4/pages/quiz/result_page.dart';
import 'package:language_learning_app_d4/providers/quiz_provider.dart';
import 'package:language_learning_app_d4/widgets/button_widget.dart';
import 'package:language_learning_app_d4/widgets/textfield_widget.dart';

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
    if (answer?.quizCompleted != false) {
      Get.off(ResultPage(id: question!.quizId));
    } else {
      inputController.clear();
    }
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
          leading: SizedBox(),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            count,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: isLoading
                  ? CircularProgressIndicator()
                  : Column(
                      children: [
                        Text(
                          q,
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFieldWidget(
                          hint: "Your answer",
                          focus: FocusNode(),
                          controller: inputController,
                        ),
                        Spacer(),
                        ButtonWidget(
                          text: "Submit",
                          onTap: () {
                            check();
                          },
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
