class FolderHistoryModel {
  late String folderTitle;
  late String folderOwner;
  late bool isMyOwnFolder;
  late List<QuizHistoryModel> quizHistory;

  FolderHistoryModel.fromJson(Map json) {
    final data = json["data"];
    folderTitle = data["folder_title"];
    folderOwner = data["folder_owner"];
    isMyOwnFolder = data["is_my_own_folder"];
    final json = List.from(data["quiz_history"]);
    quizHistory = json.map((j) => QuizHistoryModel.fromJson(i)).toList();
  }
}

class QuizHistoryModel {
  late int quizId;
  late bool score;
  late int correctAnswers;
  late int totalQuestions;
  late DateTime completedAt;

  QuizHistoryModel.fromJson(Map json) {
    quizId = json["quiz_id"];
    score = json["score"];
    correctAnswers = json["correct_answers"];
    totalQuestions = json["total_questions"];
    completedAt = DateTime.parse(json["completed_at"]);
  }
}
