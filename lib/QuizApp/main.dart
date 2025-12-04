import 'package:basic/QuizApp/data/smapleQuiz.dart';
import 'package:flutter/material.dart';
import 'package:basic/QuizApp/data/quiz_repository.dart';
import 'package:basic/QuizApp/model/quiz.dart';
import 'ui/quiz_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  QuizRepository quizRepository = await QuizRepository.create();
  runApp(
    QuizApp(
      quiz: Quiz.loadQuiz(quizRepository.questions),
      quizRepository: quizRepository,
    ),
  );
}
