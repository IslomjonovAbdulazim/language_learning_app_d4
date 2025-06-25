import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:language_learning_app_d4/models/quiz_models.dart';
import 'package:language_learning_app_d4/utils/api_constants.dart';

import '../services/auth_service.dart';

class QuizProvider {
  static Future<QuestionModel?> start(int id) async {
    final uri = Uri.parse(ApiConstants.start(id));
    final response = await http.post(
      uri,
      headers: {
        "Authorization": "Bearer ${AuthService.token}",
        "Content-Type": "application/json",
      },
      body: jsonEncode(
        {"quiz_type": "definition", "question_count": 10},
      ),
    );
    final body = jsonDecode(response.body);
    if (response.statusCode == 200 && body["status_code"] == 201) {
      final question = QuestionModel.fromJson(body);
      return question;
    }
    Get.snackbar(
      "Something went wrong",
      "Cannot start quiz. Please try again later",
      colorText: Colors.red.shade800,
    );
    return null;
  }

  static Future<AnswerResultModel?> answer(String answer, int quiz) async {
    final uri = Uri.parse(ApiConstants.answer(quiz));
    final response = await http.post(
      uri,
      headers: {
        "Authorization": "Bearer ${AuthService.token}",
        "Content-Type": "application/json",
      },
      body: jsonEncode({"answer": answer}),
    );
    final body = jsonDecode(response.body);
    if (response.statusCode == 200 && body["status_code"] == 200) {
      final model = AnswerResultModel.fromJson(body);
      return model;
    }
    Get.snackbar(
      "Something went wrong",
      "Cannot submit your answer. Please try again later",
      colorText: Colors.red.shade800,
    );
    return null;
  }

  static Future<ResultModel?> results(int id) async {
    final uri = Uri.parse(ApiConstants.results(id));
    final response = await http.get(
      uri,
      headers: {
        "Authorization": "Bearer ${AuthService.token}",
        "Content-Type": "application/json",
      },
    );
    final body = jsonDecode(response.body);
    if (response.statusCode == 200 && body["status_code"] == 200) {
      return ResultModel.fromJson(body);
    }
    Get.snackbar(
      "Something went wrong",
      "When Loading Quiz Result #$id",
      colorText: Colors.red.shade800,
    );
    return null;
  }
}
