class FolderModel {
  late int id;
  late String title;
  late String description;

  FolderModel({
    required this.id,
    required this.title,
    required this.description,
  });

  FolderModel.fromJson(Map json) {
    id = json["id"];
    title = json["title"];
    description = json["description"];
  }

  Map toJson() => {
    "id": id,
    "title": title,
    "description": description,
  };
}
