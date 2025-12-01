import 'package:basic/QuizApp/model/question.dart';

class Answer {
  String selectedChoise;
  Question question;
  Answer(this.question, this.selectedChoise);

  bool get isGood => question.goodChoise == selectedChoise;
  Answer clone() => Answer(question, selectedChoise);
}
