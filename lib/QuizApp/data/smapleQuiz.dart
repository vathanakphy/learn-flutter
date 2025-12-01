import 'package:basic/QuizApp/model/question.dart';
import 'package:basic/QuizApp/model/quiz.dart';

Quiz generateSampleQuiz() {
  return Quiz.loadQuiz([
    Question(
      "What is the capital of France?",
      ["Paris", "London", "Rome", "Berlin"],
      "Paris",
    ),
    Question(
      "Which planet is known as the Red Planet?",
      ["Earth", "Mars", "Jupiter", "Venus"],
      "Mars",
    ),
    Question(
      "What is 2 + 2?",
      ["3", "4", "5", "22"],
      "4",
    ),
    Question(
      "Which animal is known as the King of the Jungle?",
      ["Lion", "Tiger", "Elephant", "Giraffe"],
      "Lion",
    ),
    Question(
      "Which gas do plants absorb during photosynthesis?",
      ["Oxygen", "Carbon Dioxide", "Nitrogen", "Hydrogen"],
      "Carbon Dioxide",
    ),
  ]);
}
