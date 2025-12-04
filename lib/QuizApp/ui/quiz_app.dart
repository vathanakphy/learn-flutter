import 'package:basic/QuizApp/data/quiz_repository.dart';
import 'package:basic/QuizApp/model/quiz.dart';
import 'package:basic/QuizApp/model/submission.dart';
import 'package:basic/QuizApp/ui/screens/hisotry_screen.dart';
import 'package:basic/QuizApp/ui/screens/question_screen.dart';
import 'package:basic/QuizApp/ui/screens/result_screen.dart';
import 'package:basic/QuizApp/ui/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key, required this.quizRepository});
  final QuizRepostiry quizRepository;
  @override
  State<QuizApp> createState() => _QuizAppState();
}

enum Screen { home, question, result, history }

class _QuizAppState extends State<QuizApp> {
  late Quiz quiz;
  Screen current = Screen.home;

  @override
  void initState() {
    super.initState();
    quiz = Quiz.loadQuiz(widget.quizRepository.questions);
  }

  void startQuiz() {
    quiz.reset();
    setState(() => current = Screen.question);
  }

  void finishQuiz() {
    widget.quizRepository.submissions.add(Submission.create(quiz));
    setState(() => current = Screen.result);
  }

  void resultView(Quiz quizResult) {
    quiz.answers = quizResult.answers;
    setState(() => current = Screen.result);
  }

  void backHome() {
    setState(() => current = Screen.home);
  }

  void history() {
    setState(() => current = Screen.history);
  }

  Widget renderScreen(Screen screen) {
    switch (screen) {
      case Screen.home:
        return WelcomeScreen(startQuiz: startQuiz, hisotryQuiz: history);
      case Screen.question:
        return QuestionScreen(quiz: quiz, onQuizFinished: finishQuiz);
      case Screen.result:
        return ResultScreen(onRestart: backHome, quiz: quiz);
      case Screen.history:
        return HistoryScreen(
          resultView: resultView,
          submitons: widget.quizRepository.submissions,
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
