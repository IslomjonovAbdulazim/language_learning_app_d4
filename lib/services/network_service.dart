import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/auth_models.dart';

class NetworkService {
  static const baseUrl = "http://81.19.135.65:8000";

  static Future<bool> login(LoginModel model) async {
    final uri = Uri.parse("$baseUrl/api/v1/auth/register");
    final response = await http.post(
      uri,
      body: jsonEncode(model.toJson()),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );

    if (response.statusCode == 200) {
      // continue ...
      return true;
    } else {
      Get.closeAllSnackbars();
      Get.snackbar(
        "Login Error",
        "Wrong Credentials, please check credentials and try again",
        backgroundColor: Colors.red.shade800,
        colorText: Colors.white,
      );
      return false;
    }
  }
}
