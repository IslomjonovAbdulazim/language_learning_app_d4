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
