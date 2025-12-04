import 'package:basic/QuizApp/model/quiz.dart';
import 'package:basic/QuizApp/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  final Quiz quiz;
  final VoidCallback onQuizFinished;

  const QuestionScreen({
    super.key,
    required this.quiz,
    required this.onQuizFinished,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;
  
  String? selectedAnswer;
  bool showResult = false;

  void answerQuestion(String answer) {
    if (showResult) return;
    setState(() {
      selectedAnswer = answer;
      widget.quiz.answerQuesiton(currentQuestionIndex, answer);
      showResult = true;
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      if (!mounted) return;
      if (currentQuestionIndex < widget.quiz.questions.length - 1) {
        setState(() {
          currentQuestionIndex++;
          selectedAnswer = null;
          showResult = false;
        });
      } else {
        widget.onQuizFinished();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.quiz.questions[currentQuestionIndex];

    return Container(
      color: Colors.blue.shade300,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              question.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ...question.choise.map((answer) {
            Color buttonColor = Colors.white;
            if (showResult) {
              if (answer == question.goodChoise) {
                buttonColor = Colors.green;
              } else if (answer == selectedAnswer) {
                buttonColor = Colors.red;
              }
            }
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: AppButton(
                answer,
                onTap: () => answerQuestion(answer),
                color: buttonColor,
              ),
            );
          }),
        ],
      ),
    );
  }
}
