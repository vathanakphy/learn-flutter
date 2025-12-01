import 'package:basic/QuizApp/data/smapleQuiz.dart';
import 'package:basic/QuizApp/model/submition.dart';
import 'package:basic/QuizApp/model/quiz.dart';
import 'package:flutter/material.dart';
import 'ui/quiz_app.dart';

class QuizApplication {
  static void main() {
    // 1 - Load the quiz data
    Quiz quiz = generateSampleQuiz();
    // 2 - Display the quiz
    List<Submition> listSubmiton = [];
    runApp(QuizApp(quiz: quiz,submitons: listSubmiton));
  }
}
