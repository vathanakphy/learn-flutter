import 'package:basic/QuizApp/model/quiz.dart';

class Submission {
  final DateTime date;
  final Quiz quiz;

  Submission({required this.date, required this.quiz});

  factory Submission.create(Quiz quiz) {
    return Submission(date: DateTime.now(), quiz: quiz.clone());
  }
}
