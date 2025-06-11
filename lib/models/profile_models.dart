class ProfileModel {
  late int id;
  late String? avatarUrl;
  late bool isVerified;
  late String username;
  late String email;
  late int totalFolders;
  late int totalQuizzesTaken;
  late String name;
  late String? bio;
  late DateTime createdAt;

  ProfileModel({
    required this.id,
    required this.email,
    required this.name,
    required this.username,
    required this.isVerified,
    required this.totalFolders,
    required this.totalQuizzesTaken,
    required this.createdAt,
    this.bio,
    this.avatarUrl,
  });

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    username = json['username'];
    bio = json['bio'];
    avatarUrl = json['avatar_url'];
    isVerified = json['is_verified'];
    totalFolders = json['total_folders_created'];
    totalQuizzesTaken = json['total_quizzes_taken'];
    createdAt = DateTime.parse(json['created_at']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'username': username,
        'bio': bio,
        'avatar_url': avatarUrl,
        'is_verified': isVerified,
        'total_folders': totalFolders,
        'total_quizzes_taken': totalQuizzesTaken,
        'created_at': createdAt.toIso8601String(),
      };
}
