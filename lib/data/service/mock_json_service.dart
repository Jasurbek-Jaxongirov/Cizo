import 'dart:async';
import 'dart:convert';
import 'package:cizo/data/model/quiz.dart';
import 'package:flutter/services.dart';

class MockCizoService {
  Future<List<Quiz>> getQuizResponse() async {
    final quiz = await _getQuizes();

    return quiz;
  }

  Future<List<Quiz>> _getQuizes() async {
    final quizResponse = await getStringJson();
    return quizResponse.quizes;
  }

  Future<QuizResponse> getStringJson() async {
    await Future.delayed(const Duration(seconds: 2));
    final quizString = await _loadAsset('assets/mock_json/mock_json.json');
    final jsonData = json.decode(quizString);

    final quizes = QuizResponse.fromJson(jsonData);
    return quizes;
  }

  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}
