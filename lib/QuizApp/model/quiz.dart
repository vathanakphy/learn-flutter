import 'package:basic/QuizApp/model/answer.dart';
import 'package:basic/QuizApp/model/question.dart';

class Quiz {
  List<Question> questions = [];
  List<Answer> answers = [];

  Quiz.loadQuiz(this.questions);

  void addQuestion(Question question) {
    questions.add(question);
  }

  Question getQuestion(int index) {
    return questions.elementAt(index);
  }

  get scores => answers.where((ans) => ans.isGood).length;

  get percent => (scores / questions.length) * 100;

  void answerQuesiton(int questionIndex, String choise) {
    answers.add(Answer(questions.elementAt(questionIndex), choise));
  }

  void reset() {
    answers.clear();
  }

  Quiz clone() {
    final clonedQuiz = Quiz.loadQuiz(questions);
    clonedQuiz.answers = answers.map((a) => a.clone()).toList();
    return clonedQuiz;
  }

  Map<String, dynamic> toJson() => {
    "questions": questions.map((q) => q.toJson()).toList(),
  };

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz.loadQuiz(
      (json["questions"] as List).map((e) => Question.fromJson(e)).toList(),
    );
  }
}
