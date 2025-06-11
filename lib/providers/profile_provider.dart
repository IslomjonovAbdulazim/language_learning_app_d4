import 'dart:convert';

import '../models/profile_models.dart';
import "../services/auth_service.dart";
import '../utils/api_constants.dart';
import 'package:http/http.dart' as http;

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
}