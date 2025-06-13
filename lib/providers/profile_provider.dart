import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/profile_models.dart';
import "../services/auth_service.dart";
import '../utils/api_constants.dart';

class ProfileProvider {
  static Future<ProfileModel?> getProfile() async {
    final uri = Uri.parse(ApiConstants.profile);
    final response = await http.get(
      uri,
      headers: {
        "Authorization": "Bearer ${AuthService.token}",
      },
    );
    final body = jsonDecode(response.body);
    if (response.statusCode == 200 && body["status_code"] == 200) {
      final model = ProfileModel.fromJson(body["data"]);
      return model;
    }
    return null;
  }

  static Future<bool> updateName(String name) async {
    final uri = Uri.parse(ApiConstants.profile);
    final response = await http.put(
      uri,
      headers: {
        "Authorization": "Bearer ${AuthService.token}",
        "Content-Type": "application/json",
      },
      body: jsonEncode({"name": name}),
    );
    final body = jsonDecode(response.body);
    if (response.statusCode == 200 && body["status_code"] == 200) {
      Get.snackbar(
        "Name Changed Successfully",
        "",
        colorText: Colors.green.shade700,
      );
      return true;
    }
    Get.snackbar(
      "Something went wrong",
      "",
      colorText: Colors.red.shade700,
    );
    return false;
  }

  static Future<bool> updateBio(String bio) async {
    final uri = Uri.parse(ApiConstants.profile);
    final response = await http.put(
      uri,
      headers: {
        "Authorization": "Bearer ${AuthService.token}",
        "Content-Type": "application/json",
      },
      body: jsonEncode({"bio": bio}),
    );
    final body = jsonDecode(response.body);
    if (response.statusCode == 200 && body["status_code"] == 200) {
      Get.snackbar(
        "Bio Changed Successfully",
        "",
        colorText: Colors.green.shade700,
      );
      return true;
    }
    Get.snackbar(
      "Something went wrong",
      "",
      colorText: Colors.red.shade700,
    );
    return false;
  }

  static Future<bool> updateUsername(String username) async {
    final uri = Uri.parse(ApiConstants.profile);
    final response = await http.put(
      uri,
      headers: {
        "Authorization": "Bearer ${AuthService.token}",
        "Content-Type": "application/json",
      },
      body: jsonEncode({"username": username}),
    );
    final body = jsonDecode(response.body);
    if (response.statusCode == 200 && body["status_code"] == 200) {
      Get.snackbar(
        "Username Changed Successfully",
        "",
        colorText: Colors.green.shade700,
      );
      return true;
    }
    Get.snackbar(
      "Something went wrong",
      "",
      colorText: Colors.red.shade700,
    );
    return false;
  }
}













