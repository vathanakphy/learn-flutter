import 'package:basic/QuizApp/model/quiz.dart';

class Submition {
  final DateTime date;
  final Quiz quiz; 

  Submition({required this.date, required this.quiz});

  factory Submition.create(Quiz quiz) {
    return Submition(
      date: DateTime.now(),
      quiz: quiz.clone(),
    );
  }
}
