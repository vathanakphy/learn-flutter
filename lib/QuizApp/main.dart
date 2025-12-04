import 'package:basic/QuizApp/data/quiz_repository.dart';
import 'package:flutter/material.dart';
import 'ui/quiz_app.dart';

class QuizApplication {
  static void main() {
    // 1 - Load the quiz data
    QuizRepostiry quizRepostiry = QuizRepostiry();
    runApp(QuizApp(quizRepository: quizRepostiry));
  }
}
