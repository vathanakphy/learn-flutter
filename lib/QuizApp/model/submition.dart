import 'package:basic/QuizApp/model/quiz.dart';

class Submission {
  final DateTime date;
  final Quiz quiz;

  Submission({required this.date, required this.quiz});

  factory Submission.create(Quiz quiz) {
    return Submission(date: DateTime.now(), quiz: quiz.clone());
  }

  Map<String, dynamic> toJson() => {
    "date": date.toIso8601String(),
    "quiz": quiz.toJson(),
  };

  factory Submission.fromJson(Map<String, dynamic> json) {
    return Submission(
      date: DateTime.parse(json["date"]),
      quiz: Quiz.fromJson(json["quiz"]),
    );
  }
}
