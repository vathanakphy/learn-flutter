import 'package:basic/QuizApp/model/quiz.dart';
import 'package:basic/QuizApp/model/submition.dart';
import 'package:basic/QuizApp/ui/screens/hisotry_screen.dart';
import 'package:basic/QuizApp/ui/screens/question_screen.dart';
import 'package:basic/QuizApp/ui/screens/result_screen.dart';
import 'package:basic/QuizApp/ui/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key, required this.quiz, required this.submitons});
  final Quiz quiz;
  final List<Submition> submitons;
  @override
  State<QuizApp> createState() => _QuizAppState();
}

enum Screen { home, question, result, history }

class _QuizAppState extends State<QuizApp> {
  Screen current = Screen.home;

  void startQuiz() {
    setState(() {
      current = Screen.question;
    });
    widget.quiz.reset();
  }

  void finishQuiz() {
    setState(() {
      current = Screen.result;
    });
    widget.submitons.add(Submition.create(widget.quiz));
  }

  void resultView(Quiz quiz) {
    setState(() {
      current = Screen.result;
    });
    widget.quiz.answers = quiz.answers;
  }

  void backHome() {
    setState(() {
      current = Screen.home;
    });
  }

  void history() {
    setState(() {
      current = Screen.history;
    });
  }

  Widget renderScreen(Screen screen) {
    switch (screen) {
      case Screen.home:
        return WelcomeScreen(startQuiz: startQuiz, hisotryQuiz: history);
      case Screen.question:
        return QuestionScreen(quiz: widget.quiz, onQuizFinished: finishQuiz);
      case Screen.result:
        return ResultScreen(onRestart: backHome, quiz: widget.quiz);
      case Screen.history:
        return HistoryScreen(
          resultView: resultView,
          submitons: widget.submitons,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Quiz App"),
          leading: current == Screen.history
              ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: backHome,
                )
              : null,
        ),
        body: renderScreen(current),
      ),
    );
  }
}
