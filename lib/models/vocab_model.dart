class VocabModel {
  // member
  late int id;
  late String word;
  late String translation;
  late DateTime createdAt;

  // constructor
  VocabModel({
    required this.id,
    required this.word,
    required this.translation,
    required this.createdAt,
  });

  // fromJson
  VocabModel.fromJson(Map json) {
    id = json["id"];
    word = json["word"];
    translation = json["translation"];
    createdAt = DateTime.parse(json["created_at"]);
  }

  // toJson
  Map toJson() => {
    "id": id,
    "word": word,
    "translation": translation,
    "created_at": createdAt.toIso8601String(),
    "definition": "",
    "example_sentence": "",
  };
}









