import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../screens/exam_detail_screen.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  const ExamCard({super.key, required this.exam});

  String formatDate(DateTime date) {
    String two(int n) => n.toString().padLeft(2, '0');
    return "${two(date.day)}.${two(date.month)}.${date.year}";
  }

  String formatTime(DateTime date) {
    String two(int n) => n.toString().padLeft(2, '0');
    return "${two(date.hour)}:${two(date.minute)}";
  }

  String getExamStatus() {
    final now = DateTime.now();
    final diff = exam.dateTime.difference(now).inDays;

    if (diff < 0) return "поминат";
    if (diff <= 5) return "наскоро";
    return "престојен";
  }

  @override
  Widget build(BuildContext context) {
    final date = formatDate(exam.dateTime);
    final time = formatTime(exam.dateTime);
    final status = getExamStatus();

    final isPassed = status == "поминат";
    final isSoon = status == "наскоро";

    return Opacity(
      opacity: isPassed ? 0.5 : 1.0,
      child: Card(
        color: Colors.white,
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: isSoon ? Colors.orange : Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: ListTile(
          enabled: !isPassed,
          leading: Icon(
            Icons.book,
            color: isPassed
                ? Colors.grey
                : isSoon
                ? Colors.orange
                : Colors.indigo,
          ),
          title: Text(
            exam.subjectName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                    const SizedBox(width: 6),
                    Text(
                      date,
                      style: const TextStyle(color: Colors.black87, fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 16, color: Colors.grey),
                    const SizedBox(width: 6),
                    Text(
                      time,
                      style: const TextStyle(color: Colors.black87, fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.location_on_outlined, size: 16, color: Colors.grey),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        exam.rooms.join(', '),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.black87, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          trailing: Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            decoration: BoxDecoration(
              color: isPassed
                  ? Colors.grey.shade400
                  : isSoon
                  ? Colors.orange.shade200
                  : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              status.toUpperCase(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isPassed
                    ? Colors.white
                    : isSoon
                    ? Colors.deepOrange
                    : Colors.grey.shade700,
              ),
            ),
          ),
          onTap: isPassed
              ? null
              : () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExamDetailScreen(exam: exam),
              ),
            );
          },
        ),
      ),
    );
  }
}
