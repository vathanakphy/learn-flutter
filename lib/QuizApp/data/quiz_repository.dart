import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:basic/QuizApp/model/question.dart';
import 'package:basic/QuizApp/model/submition.dart';

class QuizRepository {
  List<Submission> submissions = [];
  List<Question> questions = [];

  QuizRepository._();

  static Future<QuizRepository> create() async {
    var quizRepository = QuizRepository._();
    quizRepository.submissions = await quizRepository.loadSubmissions();
    quizRepository.questions = await quizRepository.loadQuestions();
    return quizRepository;
  }

  Future<String> _getLocalPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> _getLocalFile(String filename) async {
    final path = await _getLocalPath();
    return File('$path/$filename');
  }

  Future<void> _writeJsonFile(String filename, dynamic data) async {
    final file = await _getLocalFile(filename);
    final jsonString = jsonEncode(data);
    await file.writeAsString(jsonString);
  }

  Future<dynamic> _readJsonFile(String filename) async {
    try {
      final file = await _getLocalFile(filename);
      if (await file.exists()) {
        final jsonString = await file.readAsString();
        return jsonDecode(jsonString);
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<void> saveSubmission() async {
    final jsonList = submissions.map((s) => s.toJson()).toList();
    await _writeJsonFile('submission.json', jsonList);
  }

  Future<List<Submission>> loadSubmissions() async {
    final data = await _readJsonFile('submission.json');
    if (data is List) {
      return data.map((e) => Submission.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<void> saveQuestions() async {
    final jsonList = questions.map((q) => q.toJson()).toList();
    await _writeJsonFile('questions.json', jsonList);
  }

  Future<List<Question>> loadQuestions() async {
    final data = await _readJsonFile('questions.json');
    if (data is List) {
      return data.map((e) => Question.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
