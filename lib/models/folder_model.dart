class FolderModel {
  late int id;
  late String title;
  late String description;
  late String? shareCode;
  late bool isShareable;
  late bool isShareValid;
  late int totalWords;
  late int totalCopies;
  late int totalFollowers;
  late int totalQuizzes;
  late bool isOwner;
  late FolderOwner owner;
  late DateTime createdAt;
  late DateTime? updatedAt;
  late DateTime sharedAt;
  late DateTime? accessedAt;

  FolderModel({
    required this.id,
    required this.title,
    required this.description,
    this.shareCode = "Mock",
    this.isShareable = true,
    this.isShareValid = true,
    this.totalWords = 0,
    this.totalCopies = 0,
    this.totalFollowers = 0,
    this.totalQuizzes = 0,
    this.isOwner = true,
    FolderOwner? owner,
    this.accessedAt,
  }) {
    this.owner = owner ?? FolderOwner(username: "mock_user", name: "Mock User");
    createdAt = DateTime.now();
    updatedAt = DateTime.now();
    sharedAt = DateTime.now();
  }

  FolderModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    description = json["description"];
    shareCode = json["share_code"]; // Can be null now
    isShareable = json["is_shareable"];
    isShareValid = json["is_share_valid"];
    totalWords = json["total_words"];
    totalCopies =
        json["total_copies"] ?? json["total_followers"] ?? 0; // Fallback
    totalFollowers = json["total_followers"];
    totalQuizzes = json["total_quizzes"];
    isOwner = json["is_owner"];
    owner = FolderOwner.fromJson(json["owner"]);
    createdAt = DateTime.parse(json["created_at"]);
    updatedAt =
        json["updated_at"] != null ? DateTime.parse(json["updated_at"]) : null;
    sharedAt = DateTime.parse(json["shared_at"]);
    accessedAt = json["accessed_at"] != null
        ? DateTime.parse(json["accessed_at"])
        : null;
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
        "total_followers": totalFollowers,
        "total_quizzes": totalQuizzes,
        "is_owner": isOwner,
        "owner": owner.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "shared_at": sharedAt.toIso8601String(),
        "accessed_at": accessedAt?.toIso8601String(),
      };

  String get shareStatus {
    if (!isShareable) return "Not shareable";
    return isShareValid ? "Active" : "Invalid";
  }

  // New helper getters
  String get ownershipStatus {
    return isOwner ? "Owner" : "Following";
  }
}

class FolderOwner {
  late String username;
  late String name;

  FolderOwner({
    required this.username,
    required this.name,
  });

  FolderOwner.fromJson(Map json) {
    username = json["username"];
    name = json["name"];
  }

  Map toJson() => {
        "username": username,
        "name": name,
      };
}
