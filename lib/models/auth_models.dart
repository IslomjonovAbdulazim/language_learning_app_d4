class LoginModel {
  // members
  late String email;
  late String password;

  // constructor
  LoginModel({
    required this.email,
    required this.password,
  });

  // fromJson
  LoginModel.fromJson(Map json) {
    email = json["email"];
    password = json["password"];
  }

  // toJson
  Map toJson() => {
    "email": email,
    "password": password,
  };
}

class RegisterModel {
  // members
  late String email;
  late String password;
  late String name;

  // constructor
  RegisterModel({
    required this.email,
    required this.password,
    required this.name,
  });

  // fromJson
  RegisterModel.fromJson(Map json) {
    email = json["email"];
    password = json["password"];
    name = json["name"];
  }

  // toJson
  Map toJson() => {
    "email": email,
    "password": password,
    "name": name,
  };
}