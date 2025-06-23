class QuestionModel {
  late int quizId;
  late int folderId;
  late String folderTitle;
  late String folderOwner;
  late int questionCount;
  late int currentQuestion;
  late String word;

  QuestionModel.fromJson(Map json) {
    final data = json["data"];
    quizId = data["quiz_id"];
    folderId = data["folder_id"];
    folderTitle = data["folder_title"];
    folderOwner = data["folder_owner"];
    questionCount = data["question_count"];
    currentQuestion = data["current_question"];
    word = data["question"]["word"] ?? "";
  }
}

class AnswerResultModel {
  late bool isCorrect;
  late String correctAnswer;
  late bool quizCompleted;

  // Only present if quiz continues
  int? currentQuestion;
  int? totalQuestions;
  String? nextWord;

  // Only present if quiz completed
  double? finalScore;
  String? message;

  AnswerResultModel.fromJson(Map json) {
    final data = json["data"];
    isCorrect = data["is_correct"];
    correctAnswer = data["correct_answer"];
    quizCompleted = data["quiz_completed"];

    if (!quizCompleted) {
      // Quiz continues - next question data
      currentQuestion = data["current_question"];
      totalQuestions = data["total_questions"];
      final nextQuestion = data["next_question"];
      if (nextQuestion != null) {
        nextWord = nextQuestion["word"];
      }
    } else {
      // Quiz completed
      finalScore = data["final_score"]?.toDouble();
      message = data["message"];
    }
  }
}

class AnswerModel {
  late String word;
  late String question;
  late String correctAnswer;
  late String userAnswer;
  late bool isCorrect;

  AnswerModel.fromJson(Map json) {
    word = json["word"];
    question = json["question"];
    correctAnswer = json["correct_answer"];
    userAnswer = json["user_answer"];
    isCorrect = json["is_correct"];
  }
}

class ResultModel {
  late int quizId;
  late String folderTitle;
  late String folderOwner;
  late double score;
  late int correctAnswers;
  late int totalQuestions;
  late DateTime startedAt;
  late DateTime? completedAt;
  late List<AnswerModel> answers;

  ResultModel.fromJson(Map json) {
    final data = json["data"];
    quizId = data["quiz_id"];
    folderTitle = data["folder_title"];
    folderOwner = data["folder_owner"];
    score = data["score"].toDouble();
    correctAnswers = data["correct_answers"];
    totalQuestions = data["total_questions"];
    startedAt = DateTime.parse(data["started_at"]);
    completedAt = data["completed_at"] != null
        ? DateTime.parse(data["completed_at"])
        : null;

    final answersList = List.from(data["answers"]);
    answers = answersList.map((j) => AnswerModel.fromJson(j)).toList();
  }
}
