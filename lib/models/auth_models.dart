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

class GoogleAuthModel {
  // members
  late String email;
  late String token;
  late String name;
  late String avatar;
  late String googleId;

  // constructor
  GoogleAuthModel({
    required this.email,
    required this.token,
    required this.name,
    required this.avatar,
    required this.googleId,
  });

  // fromJson
  GoogleAuthModel.fromJson(Map json) {
    email = json["email"];
    token = json["token"];
    name = json["name"];
    avatar = json["avatar"];
    googleId = json["google_id"];
  }

  // toJson
  Map toJson() => {
        "email": email,
        "token": token,
        "name": name,
        "avatar": avatar,
        "google_id": googleId,
      };
}

class AuthResponseModel {
  late int statusCode;
  late String details;
  late bool isSuccess;
  late String? token;

  AuthResponseModel({
    required this.statusCode,
    required this.details,
    required this.isSuccess,
    required this.token,
  });

  AuthResponseModel.fromJson(Map json) {
    statusCode = json["status_code"];
    details = json["details"];
    isSuccess = json["is_success"];
    token = json["token"];
  }

  Map toJson() => {
    "status_code": statusCode,
    "details": details,
    "is_success": isSuccess,
    "token": token,
  };
}
