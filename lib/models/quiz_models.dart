class QuestionModel {
  late int questionCount;
  late int currentQuestion;
  late String word;

  QuestionModel.fromJson(Map json) {
    questionCount = json["question_count"];
    currentQuestion = json["current_question"];
    word = json["question"]["word"];
  }
}

class AnswerResultModel {
  late bool isCorrect;
  late String correctAnswer;
  late int currentQuestion;
  late int totalQuestions;
  late String word;

  AnswerResultModel.fromJson(Map json) {
    isCorrect = json["is_correct"];
    correctAnswer = json["correct_answer"];
    currentQuestion = json["current_question"];
    totalQuestions = json["total_questions"];
    word = json["next_question"]["word"];
  }
}

class AnswerModel {
  late String word;
  late String correctAnswer;
  late String userAnswer;
  late bool isCorrect;

  AnswerModel.fromJson(Map json) {
    word = json["word"];
    correctAnswer = json["correct_answer"];
    userAnswer = json["user_answer"];
    isCorrect = json["is_correct"];
  }
}

class ResultModel {
  late String folderTitle;
  late String folderOwner;
  late int score;
  late int correctAnswers;
  late int totalQuestions;
  late DateTime start;
  late DateTime end;
  late List<AnswerModel> answers;

  ResultModel.fromJson(Map json) {
    folderTitle = json["folder_title"];
    folderOwner = json["folder_owner"];
    score = json["score"];
    correctAnswers = json["correct_answers"];
    totalQuestions = json["total_questions"];
    start = DateTime.parse(json["started_at"]);
    end = DateTime.parse(json["completed_at"]);
    final list = List.from(json["answers"]);
    answers = list.map((j) => AnswerModel.fromJson(j)).toList();
  }
}










