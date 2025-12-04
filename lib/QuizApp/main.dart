import 'package:basic/QuizApp/data/quiz_repository.dart';
import 'package:basic/QuizApp/data/smapleQuiz.dart';
import 'package:basic/QuizApp/model/quiz.dart';
import 'package:flutter/material.dart';
import 'ui/quiz_app.dart';

class QuizApplication {
  static void main() {
    // 1 - Load the quiz data
    QuizRepostiry quizRepostiry = QuizRepostiry();
    Quiz quiz = generateSampleQuiz();
    runApp(QuizApp(quiz: quiz, quizRepostiry: quizRepostiry));
  }
}
