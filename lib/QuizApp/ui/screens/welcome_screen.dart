import 'package:basic/QuizApp/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback startQuiz;
    final VoidCallback hisotryQuiz;

  const WelcomeScreen({super.key, required this.startQuiz, required this.hisotryQuiz});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 300,   child: Image.asset('assets/quiz-logo.png')),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: AppButton(
                  "Start Quiz",
                  onTap: startQuiz, // remove const
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: AppButton(
                  "History",
                  onTap: hisotryQuiz, // remove const
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
