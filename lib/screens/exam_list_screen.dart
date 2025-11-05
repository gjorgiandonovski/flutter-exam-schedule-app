import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';

class ExamListScreen extends StatelessWidget {
  const ExamListScreen({super.key});

  List<Exam> get exams => [
    Exam(
      subjectName: 'ООП',
      dateTime: DateTime(2025, 10, 20, 9, 0),
      rooms: ['Lab 13'],
      isPassed: false,
      capacity: 45,
      registered: 45,
    ),
    Exam(
      subjectName: 'Веб дизајн',
      dateTime: DateTime(2025, 10, 30, 14, 0),
      rooms: ['117'],
      isPassed: false,
      capacity: 50,
      registered: 48,
    ),
    Exam(
      subjectName: 'Математика 3',
      dateTime: DateTime(2025, 11, 7, 9, 0),
      rooms: ['223', '225'],
      isPassed: false,
      capacity: 80,
      registered: 65,
    ),
    Exam(
      subjectName: 'Алгоритми и податочни структури',
      dateTime: DateTime(2025, 11, 8, 11, 0),
      rooms: ['215'],
      isPassed: false,
      capacity: 60,
      registered: 57,
    ),
    Exam(
      subjectName: 'Компјутерски мрежи',
      dateTime: DateTime(2025, 11, 20, 10, 0),
      rooms: ['Lab 12'],
      isPassed: false,
      capacity: 55,
      registered: 35,
    ),
    Exam(
      subjectName: 'Веројатност и статистика',
      dateTime: DateTime(2025, 11, 25, 12, 0),
      rooms: ['200A'],
      isPassed: false,
      capacity: 70,
      registered: 60,
    ),
    Exam(
      subjectName: 'Интегрирани системи',
      dateTime: DateTime(2025, 12, 10, 13, 0),
      rooms: ['200B'],
      isPassed: false,
      capacity: 40,
      registered: 32,
    ),
    Exam(
      subjectName: 'Софверски квалитет',
      dateTime: DateTime(2026, 1, 15, 10, 0),
      rooms: ['117'],
      isPassed: false,
      capacity: 50,
      registered: 49,
    ),
    Exam(
      subjectName: 'Напредни бази на податоци',
      dateTime: DateTime(2026, 1, 25, 8, 0),
      rooms: ['223'],
      isPassed: false,
      capacity: 70,
      registered: 52,
    ),
    Exam(
      subjectName: 'Мобилни информ. системи',
      dateTime: DateTime(2026, 2, 5, 9, 0),
      rooms: ['138'],
      isPassed: false,
      capacity: 90,
      registered: 77,
    ),
    Exam(
      subjectName: 'Програмирање на веб сервери',
      dateTime: DateTime(2026, 2, 8, 12, 0),
      rooms: ['Lab 11'],
      isPassed: false,
      capacity: 60,
      registered: 50,
    ),
    Exam(
      subjectName: 'Системска интеграција',
      dateTime: DateTime(2026, 2, 12, 11, 0),
      rooms: ['318'],
      isPassed: false,
      capacity: 45,
      registered: 42,
    ),
    Exam(
      subjectName: 'Вештачка интелигенција',
      dateTime: DateTime(2026, 2, 17, 9, 30),
      rooms: ['310'],
      isPassed: false,
      capacity: 65,
      registered: 55,
    ),
    Exam(
      subjectName: 'Развој на мобилни апликации',
      dateTime: DateTime(2026, 2, 21, 10, 0),
      rooms: ['319'],
      isPassed: false,
      capacity: 55,
      registered: 50,
    ),
    Exam(
      subjectName: 'Паралелно програмирање',
      dateTime: DateTime(2026, 3, 1, 13, 0),
      rooms: ['A1', 'A2'],
      isPassed: false,
      capacity: 100,
      registered: 80,
    ),
  ];


  @override
  Widget build(BuildContext context) {
    final sortedExams = exams..sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Распоред за испити - 213040"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: sortedExams.length,
        itemBuilder: (context, index) {
          return ExamCard(exam: sortedExams[index]);
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.indigo.shade50,
        padding: const EdgeInsets.all(12),
        child: Text(
          "Вкупно испити: ${exams.length}",
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
