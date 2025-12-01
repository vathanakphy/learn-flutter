import 'package:basic/QuizApp/model/answer.dart';
import 'package:basic/QuizApp/model/quiz.dart';
import 'package:basic/QuizApp/ui/widgets/app_button.dart';
import 'package:basic/QuizApp/ui/widgets/circle_number.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final Quiz quiz;
  final VoidCallback onRestart;

  const ResultScreen({super.key, required this.quiz, required this.onRestart});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.blue.shade500),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "You Answer correct ${quiz.scores} of ${quiz.questions.length}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: quiz.answers.length,
              itemBuilder: (context, index) => AnswerChoice(
                answer: quiz.answers[index],
                index: index, 
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 150),
            child: AppButton(
              "Restart Quiz",
              onTap: onRestart, 
            ),
          ),
                  SizedBox(height: 30,)

        ],
      ),
    );
  }
}

class AnswerChoice extends StatelessWidget {
  final Answer answer;
  final int index;

  const AnswerChoice({super.key, required this.answer, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              CircleNumber(
                number: index + 1,
                color: answer.isGood?Colors.green:Colors.red
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  answer.question.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        ...answer.question.choise.map((choice) {
          IconData? iconData;
          if (choice == answer.question.goodChoise) {
            iconData = Icons.check;
          } else if (choice == answer.selectedChoise &&
              choice != answer.question.goodChoise) {
            iconData = Icons.close;
          }
          Color iconColor = Colors.black; 

          if (choice == answer.question.goodChoise) {
            iconData = Icons.check;
            iconColor = Colors.green;
          } else if (choice == answer.selectedChoise &&
              choice != answer.question.goodChoise) {
            iconData = Icons.close;
            iconColor = Colors.red; 
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: iconData != null
                      ? Icon(iconData, size: 20, color: iconColor)
                      : null,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    choice,
                    style: TextStyle(fontSize: 16, color: iconColor,fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

          );

        }),
      ],

    );
  }
}
