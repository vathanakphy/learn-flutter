import 'package:basic/QuizApp/model/quiz.dart';
import 'package:basic/QuizApp/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:basic/QuizApp/model/submition.dart';

class HistoryScreen extends StatelessWidget {
  final void Function(Quiz) resultView;
  final List<Submission> submitons;

  const HistoryScreen({
    super.key,
    required this.resultView,
    required this.submitons,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade300,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: submitons.isEmpty
                ? const Center(
                    child: Text(
                      "No history yet",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )
                : ListView.builder(
                    itemCount: submitons.length,
                    itemBuilder: (context, index) {
                      final sub = submitons[index];
                      final score = sub.quiz.scores;
                      final total = sub.quiz.questions.length;
                      final date =
                          "${sub.date.day}/${sub.date.month}/${sub.date.year}";
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 16,
                        ),
                        child: AppButton(
                          "$date - Score: $score/$total",
                          onTap: () => resultView(sub.quiz),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
