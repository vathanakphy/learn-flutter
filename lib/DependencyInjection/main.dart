import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// SERVICES

class StudentsService {
  String getStudents() => "Students loaded";
}

class CourseService {
  String getCourses() => "Courses loaded";
}

class GradesService {
  String getGrades() => "Grades loaded";
}

// MAIN ---------------------------------------

void main() {
  runApp(
    MaterialApp(
      home: MultiProvider(
        providers: [
          Provider<StudentsService>(create: (context) => StudentsService()),
          Provider<CourseService>(create: (context) => CourseService()),
          Provider<GradesService>(create: (context) => GradesService()),
        ],
        child: App(),
      ),
    ),
  );
}

// UI
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("School App - Global Services")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          StudentsScreen(),
          CoursesScreen(),
          GradesScreen(),
          SettingsScreen(),
        ],
      ),
    );
  }
}

class StudentsScreen extends StatelessWidget {
  const StudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Direct global access
    StudentsService studentsService = context.read<StudentsService>();
    final data = studentsService.getStudents();

    return Text("StudentsScreen → $data");
  }
}

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CourseService courseService = context.read<CourseService>();
    final data = courseService.getCourses();

    return Text("CoursesScreen → $data");
  }
}

class GradesScreen extends StatelessWidget {
  const GradesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Direct global access
    GradesService gradesService = context.read<GradesService>();
    StudentsService studentsService = context.read<StudentsService>();
    CourseService courseService = context.read<CourseService>();

    final grades = gradesService.getGrades();
    final students = studentsService.getStudents();
    final courses = courseService.getCourses();

    return Text("GradesScreen → $grades for $students for $courses");
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Seeting");
  }
}
