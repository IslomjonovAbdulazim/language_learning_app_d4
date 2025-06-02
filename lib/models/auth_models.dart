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

class ForgetPasswordModel {
  // members
  late String email;

  // constructor
  ForgetPasswordModel({
    required this.email,
  });

  // fromJson
  ForgetPasswordModel.fromJson(Map json) {
    email = json["email"];
  }

  // toJson
  Map toJson() => {
    "email": email,
  };
}

class VerifyEmailModel {
  // members
  late String email;
  late String otpCode;

  // constructor
  VerifyEmailModel({
    required this.email,
    required this.otpCode,
  });

  // fromJson
  VerifyEmailModel.fromJson(Map json) {
    email = json["email"];
    otpCode = json["otp_code"];
  }

  // toJson
  Map toJson() => {
    "email": email,
    "otp_code": otpCode,
  };
}

class ResetPasswordModel {
  // members
  late String email;
  late String newPassword;

  // constructor
  ResetPasswordModel({
    required this.email,
    required this.newPassword,
  });

  // fromJson
  ResetPasswordModel.fromJson(Map json) {
    email = json["email"];
    newPassword = json["new_password"];
  }

  // toJson
  Map toJson() => {
    "email": email,
    "new_password": newPassword,
  };
}