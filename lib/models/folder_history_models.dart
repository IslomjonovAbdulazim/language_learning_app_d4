class FolderHistoryModel {
  late String? folderTitle;
  late String? folderOwner;
  late bool? isMyOwnFolder;
  late List<QuizHistoryModel> quizHistory;

  FolderHistoryModel.fromJson(Map json) {
    final data = json["data"];
    folderTitle = data["folder_title"];
    folderOwner = data["folder_owner"];
    isMyOwnFolder = data["is_my_own_folder"];
    final list = List.from(data["quiz_history"]);
    quizHistory = list.map((j) => QuizHistoryModel.fromJson(j)).toList();
  }
}

class QuizHistoryModel {
  late int quizId;
  late double score;
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
