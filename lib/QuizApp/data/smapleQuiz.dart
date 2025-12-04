import 'package:basic/QuizApp/model/question.dart';
import 'package:basic/QuizApp/model/quiz.dart';

Quiz generateSampleQuiz() {
  return Quiz.loadQuiz([
    Question(
      "Which programming language is used to develop Flutter apps?",
      ["Java", "Kotlin", "Dart", "Swift"],
      "Dart",
    ),
    Question(
      "What does HTML stand for?",
      ["HyperText Markup Language", "Hyper Transfer Markup Language", "Hyperlink Text Markup Language", "HyperText Markdown Language"],
      "HyperText Markup Language",
    ),
    Question(
      "Which symbol is used for single-line comments in most programming languages?",
      ["//", "/* */", "#", "<!-- -->"],
      "//",
    ),
    Question(
      "Which operator is used to assign a value to a variable?",
      ["=", "==", "+=", "-="],
      "=",
    ),
    Question(
      "What is the value of '5' + '3' in most programming languages with string concatenation?",
      ["8", "53", "Error", "None of the above"],
      "53",
    ),
    Question(
      "Which data type is used to store true or false values?",
      ["int", "String", "bool", "double"],
      "bool",
    ),
    Question(
      "Which loop is guaranteed to run at least once?",
      ["for loop", "while loop", "do-while loop", "foreach loop"],
      "do-while loop",
    ),
    Question(
      "Which of these is NOT a programming paradigm?",
      ["Object-Oriented", "Procedural", "Functional", "Circular"],
      "Circular",
    ),
    Question(
      "What is the correct way to declare a constant variable in Dart?",
      ["var x = 5;", "final x = 5;", "const x = 5;", "Both final and const"],
      "Both final and const",
    ),
    Question(
      "Which keyword is used to define a function in Dart?",
      ["def", "func", "void", "function"],
      "void",
    ),
    Question(
      "Which method is called when a Dart class is instantiated?",
      ["build()", "create()", "constructor", "init()"],
      "constructor",
    ),
    Question(
      "What does IDE stand for?",
      ["Integrated Development Environment", "Interactive Development Environment", "Internal Development Engine", "Interface Design Editor"],
      "Integrated Development Environment",
    ),
    Question(
      "Which of these is a correct boolean expression?",
      ["5 > 3", "5 = 3", "5 == ", "True 5 > 3"],
      "5 > 3",
    ),
    Question(
      "What does CSS stand for?",
      ["Cascading Style Sheets", "Computer Style Sheets", "Creative Style Syntax", "Coded Style Sheets"],
      "Cascading Style Sheets",
    ),
    Question(
      "Which of these is a way to declare a list/array in Dart?",
      ["var arr = [1,2,3];", "var arr = {1,2,3};", "var arr = (1,2,3);", "var arr = <1,2,3>;"],
      "var arr = [1,2,3];",
    ),
  ]);
}
