import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:language_learning_app_d4/services/auth_service.dart';

import '../models/auth_models.dart';

class NetworkService {
  static const baseUrl =
      "https://islomjonovabdulazim-vocab-builder-backend-f7aa.twc1.net";

  static Future<bool> login(LoginModel model) async {
    final uri = Uri.parse("$baseUrl/auth/login");
    final response = await http.post(
      uri,
      body: jsonEncode(model.toJson()),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
    if (response.statusCode == 200 && jsonDecode(response.body)["status_code"] == 200) {
      Get.closeAllSnackbars();
      Get.snackbar(
        "Successfully Logged In",
        jsonDecode(response.body)["details"] ?? "No Detail",
        colorText: Colors.white,
        backgroundColor: Colors.green.shade700,
      );
      final token = jsonDecode(response.body)["token"];
      print("Token: $token");
      AuthService.login(token.toString());
      return true;
    } else {
      Get.closeAllSnackbars();
      Get.snackbar(
        "Wrong Credentials",
        jsonDecode(response.body)["details"] ?? "No Detail",
        colorText: Colors.white,
        backgroundColor: Colors.red.shade700,
      );
      return false;
    }
  }

  static Future<bool> register(RegisterModel model) async {
    final uri = Uri.parse("$baseUrl/auth/register");
    final response = await http.post(
      uri,
      body: jsonEncode(model.toJson()),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
    if (response.statusCode == 200 && jsonDecode(response.body)["status_code"] == 201) {
      Get.closeAllSnackbars();
      Get.snackbar(
        "Successful",
        jsonDecode(response.body)["details"] ?? "No Detail",
        colorText: Colors.white,
        backgroundColor: Colors.green.shade700,
      );
      return true;
    } else {
      Get.closeAllSnackbars();
      Get.snackbar(
        "Error!",
        "Something Went Wrong! Check Your Credentials!",
        colorText: Colors.white,
        backgroundColor: Colors.red.shade700,
      );
      return false;
    }
  }

  static Future<bool> verifyRegister(VerifyEmailModel otp) async {
    final uri = Uri.parse("$baseUrl/auth/verify-email");
    final response = await http.post(
      uri,
      body: jsonEncode(otp.toJson()),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
    print(response.body);
    if (response.statusCode == 200 && jsonDecode(response.body)["status_code"] == 200) {
      Get.closeAllSnackbars();
      Get.snackbar(
        "Successfully Logged In",
        jsonDecode(response.body)["details"] ?? "No Detail",
        colorText: Colors.white,
        backgroundColor: Colors.green.shade700,
      );
      final token = jsonDecode(response.body)["token"];
      print("Token: $token");
      AuthService.login(token.toString());
      return true;
    } else {
      Get.closeAllSnackbars();
      Get.snackbar(
        "Wrong OTP Code",
        jsonDecode(response.body)["details"] ?? "No Detail",
        colorText: Colors.white,
        backgroundColor: Colors.red.shade700,
      );
      return false;
    }
  }

  static Future<bool> forgotPassword(ForgetPasswordModel model) async {
    final uri = Uri.parse("$baseUrl/auth/forgot-password");
    final response = await http.post(
      uri,
      body: jsonEncode(model.toJson()),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
    if (response.statusCode == 200 && jsonDecode(response.body)["status_code"] == 200) {
      Get.closeAllSnackbars();
      Get.snackbar(
        "Successful",
        jsonDecode(response.body)["details"] ?? "No Detail",
        colorText: Colors.white,
        backgroundColor: Colors.green.shade700,
      );
      return true;
    } else {
      Get.closeAllSnackbars();
      Get.snackbar(
        "Error!",
        "Something Went Wrong! Check Your Credentials!",
        colorText: Colors.white,
        backgroundColor: Colors.red.shade700,
      );
      return false;
    }
  }

  static Future<bool> verifyForgot(VerifyEmailModel model) async {
    final uri = Uri.parse("$baseUrl/auth/verify-email");
    final response = await http.post(
      uri,
      body: jsonEncode(model.toJson()),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
    if (response.statusCode == 200 && jsonDecode(response.body)["status_code"] == 200) {
      Get.closeAllSnackbars();
      Get.snackbar(
        "Successful",
        jsonDecode(response.body)["details"] ?? "No Detail",
        colorText: Colors.white,
        backgroundColor: Colors.green.shade700,
      );
      return true;
    } else {
      Get.closeAllSnackbars();
      Get.snackbar(
        "Error!",
        "Something Went Wrong! Check Your Credentials!",
        colorText: Colors.white,
        backgroundColor: Colors.red.shade700,
      );
      return false;
    }
  }

  static Future<bool> resetPassword(ResetPasswordModel model) async {
    final uri = Uri.parse("$baseUrl/auth/reset-password");
    final response = await http.post(
      uri,
      body: jsonEncode(model.toJson()),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
    if (response.statusCode == 200 && jsonDecode(response.body)["status_code"] == 200) {
      Get.closeAllSnackbars();
      Get.snackbar(
        "Successful",
        jsonDecode(response.body)["details"] ?? "No Detail",
        colorText: Colors.white,
        backgroundColor: Colors.green.shade700,
      );
      return true;
    } else {
      Get.closeAllSnackbars();
      Get.snackbar(
        "Error!",
        "Something Went Wrong! Check Your Credentials!",
        colorText: Colors.white,
        backgroundColor: Colors.red.shade700,
      );
      return false;
    }
  }
}
