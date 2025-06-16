import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:language_learning_app_d4/utils/api_constants.dart';

import '../models/folder_model.dart';
import '../services/auth_service.dart';

class FolderProvider {
  static Future<List<FolderModel>> getAllFolders() async {
    final uri = Uri.parse(ApiConstants.myFolder);
    final response = await http.get(
      uri,
      headers: {
        "Authorization": "Bearer ${AuthService.token}",
      },
    );
    final body = jsonDecode(response.body);
    if (response.statusCode == 200 && body["status_code"] == 200) {
      final jsonList = List.from(body["data"]);
      return jsonList.map((json) => FolderModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  static Future<bool> createFolder(FolderModel folder) async {
    final uri = Uri.parse(ApiConstants.folder);
    final response = await http.post(
      uri,
      body: jsonEncode(folder.toJson()),
      headers: {
        "Authorization": "Bearer ${AuthService.token}",
        "Content-Type": "application/json",
      },
    );
    final body = jsonDecode(response.body);
    if (response.statusCode == 200 && body["status_code"] == 200) {
      return true;
    }
    return false;
  }

  static Future<bool> updateFolder(FolderModel folder) async {
    final uri = Uri.parse(ApiConstants.folder + "/" + folder.id.toString());
    final response = await http.post(
      uri,
      body: jsonEncode(folder.toJson()),
      headers: {
        "Authorization": "Bearer ${AuthService.token}",
        "Content-Type": "application/json",
      },
    );
    final body = jsonDecode(response.body);
    if (response.statusCode == 200 && body["status_code"] == 200) {
      return true;
    }
    return false;
  }
}
