class FolderHistoryModel {
  late String folderTitle;
  late String folderOwner;
  late bool isMyOwnFolder;
  late List<QuizHistoryModel> quizHistory;
}

class QuizHistoryModel {
  late int quizId;
  late bool score;
  late int correctAnswers;
  late int totalQuestions;
  late DateTime completedAt;
}
