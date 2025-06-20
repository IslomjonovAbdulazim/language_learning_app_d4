import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/vocab_model.dart';
import '../services/auth_service.dart';
import '../utils/api_constants.dart';

class VocabProvider {
  static Future<List<VocabModel>> getAll(int id) async {
    final uri = Uri.parse(ApiConstants.vocab(id));
    final response = await http.get(
      uri,
      headers: {
        "Authorization": "Bearer ${AuthService.token}",
      },
    );
    final body = jsonDecode(response.body);
    if (response.statusCode == 200 && body["status_code"] == 200) {
      final list = List.from(body["data"]["vocabulary"]);
      return list.map((json) => VocabModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  static Future<bool> create(int id, VocabModel vocab) async {
    final uri = Uri.parse(ApiConstants.vocab(id));
    final response = await http.post(
      uri,
      body: jsonEncode(vocab.toJson()),
      headers: {
        "Authorization": "Bearer ${AuthService.token}",
        "Content-Type": "application/json",
      },
    );
    final body = jsonDecode(response.body);
    if (response.statusCode == 200 && body["status_code"] == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> update(int id, VocabModel vocab) async {
    final uri = Uri.parse("${ApiConstants.vocab(id)}/${vocab.id}");
    final response = await http.put(
      uri,
      body: jsonEncode(vocab.toJson()),
      headers: {
        "Authorization": "Bearer ${AuthService.token}",
        "Content-Type": "application/json",
      },
    );
    final body = jsonDecode(response.body);
    if (response.statusCode == 200 && body["status_code"] == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> delete(int id, VocabModel vocab) async {
    final uri = Uri.parse("${ApiConstants.vocab(id)}/${vocab.id}");
    final response = await http.delete(uri);
    final body = jsonDecode(response.body);
    if (response.statusCode == 200 && body["status_code"] == 200) {
      return true;
    } else {
      return false;
    }
  }
}
