class FolderModel {
  late int id;
  late String title;
  late String description;
  late String shareCode;
  late bool isShareable;
  late bool isShareValid;
  late int totalWords;
  late int totalCopies;
  late int totalQuizzes;
  late DateTime createdAt;
  late DateTime updatedAt;
  late DateTime sharedAt;

  FolderModel({
    required this.id,
    required this.title,
    required this.description,
    this.shareCode = "Mock",
    this.isShareable = true,
    this.isShareValid = true,
    this.totalWords = 0,
    this.totalCopies = 0,
    this.totalQuizzes = 0,
  }) {
    createdAt = DateTime.now();
    updatedAt = DateTime.now();
    sharedAt = DateTime.now();
  }

  FolderModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    description = json["description"];
    shareCode = json["share_code"];
    isShareable = json["is_shareable"];
    isShareValid = json["is_share_valid"];
    totalWords = json["total_words"];
    totalCopies = json["total_copies"];
    totalQuizzes = json["total_quizzes"];
    createdAt = DateTime.parse(json["created_at"]);
    updatedAt = DateTime.parse(json["updated_at"]);
    sharedAt = DateTime.parse(json["shared_at"]);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "share_code": shareCode,
        "is_shareable": isShareable,
        "is_share_valid": isShareValid,
        "total_words": totalWords,
        "total_copies": totalCopies,
        "total_quizzes": totalQuizzes,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "shared_at": sharedAt.toIso8601String(),
      };
}
