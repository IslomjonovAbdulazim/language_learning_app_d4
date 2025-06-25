import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:language_learning_app_d4/models/quiz_models.dart';
import 'package:language_learning_app_d4/providers/quiz_provider.dart';
import 'package:language_learning_app_d4/widgets/button_widget.dart';

class ResultPage extends StatefulWidget {
  final int id;

  const ResultPage({super.key, required this.id});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  bool isLoading = false;
  ResultModel? result;

  @override
  void initState() {
    load();
    super.initState();
  }

  void load() async {
    if (result != null) return;
    isLoading = true;
    setState(() {});
    result = await QuizProvider.results(widget.id);
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
            child: isLoading
                ? CircularProgressIndicator()
                : result == null
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Something Went Wrong",
                              style: GoogleFonts.poppins(
                                color: Colors.red.shade700,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10),
                            ButtonWidget(text: "Retry", onTap: load),
                          ],
                        ),
                      )
                    : ListView(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${result!.correctAnswers}/",
                                style: GoogleFonts.poppins(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green.shade800,
                                ),
                              ),
                              Text(
                                "${result!.totalQuestions}",
                                style: GoogleFonts.poppins(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                DateFormat.yMMMd().format(result!.startedAt),
                                style: GoogleFonts.poppins(),
                              ),
                              Spacer(),
                              Text(
                                "from ${DateFormat.Hms().format(result!.startedAt)}",
                              ),
                              Text(
                                " to ${DateFormat.Hms().format(result!.completedAt ?? DateTime.now())}",
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Divider(thickness: 0.5),
                          SizedBox(height: 5),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: result!.answers.length,
                            itemBuilder: (context, index) {
                              final model = result!.answers[index];
                              return Card(
                                child: ListTile(
                                  tileColor: model.isCorrect
                                      ? Colors.green
                                      : Colors.red,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  title: Text(
                                    "Q: ${model.word}",
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "you: ${model.userAnswer}",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  trailing: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Correct Answer",
                                        style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          letterSpacing: 0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        model.correctAnswer,
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
          ),
        ),
      ),
    );
  }
}
