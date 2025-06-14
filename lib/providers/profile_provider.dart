import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

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

  static Future<bool> uploadAvatar(dynamic imageFile) async {
    try {
      final uri = Uri.parse('${ApiConstants.baseUrl}/auth/avatar');
      final request = http.MultipartRequest('POST', uri);

      request.headers['Authorization'] = 'Bearer ${AuthService.token}';

      if (kIsWeb) {
        // Web implementation - handle both Uint8List and blob URL
        if (imageFile is String) {
          // If it's a blob URL, fetch the bytes
          final response = await http.get(Uri.parse(imageFile));
          request.files.add(http.MultipartFile.fromBytes(
            'file',
            response.bodyBytes,
            filename: 'avatar.jpg',
            contentType: MediaType('image', 'jpeg'),
          ));
        } else {
          // If it's already Uint8List
          request.files.add(http.MultipartFile.fromBytes(
            'file',
            imageFile as Uint8List,
            filename: 'avatar.jpg',
            contentType: MediaType('image', 'jpeg'),
          ));
        }
      } else {
        // Mobile implementation
        request.files.add(await http.MultipartFile.fromPath(
          'file',
          imageFile as String,
          contentType: MediaType('image', 'jpeg'),
        ));
      }

      final response = await request.send();
      final responseData = await response.stream.bytesToString();
      final body = jsonDecode(responseData);

      if (response.statusCode == 200 && body["status_code"] == 200) {
        Get.snackbar(
          "Avatar Updated Successfully",
          "",
          colorText: Colors.green.shade700,
        );
        return true;
      }

      Get.snackbar(
        "Failed to update avatar",
        "",
        colorText: Colors.red.shade700,
      );
      return false;

    } catch (e) {
      print('Upload error: $e');
      Get.snackbar(
        "Something went wrong",
        "",
        colorText: Colors.red.shade700,
      );
      return false;
    }
  }
}


