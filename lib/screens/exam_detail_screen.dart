import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatefulWidget {
  final Exam exam;
  const ExamDetailScreen({super.key, required this.exam});

  @override
  State<ExamDetailScreen> createState() => _ExamDetailScreenState();
}

class _ExamDetailScreenState extends State<ExamDetailScreen> {
  bool? going;

  String formatDate(DateTime date) {
    String two(int n) => n.toString().padLeft(2, '0');
    return "${two(date.day)}.${two(date.month)}.${date.year}";
  }

  String formatTime(DateTime date) {
    String two(int n) => n.toString().padLeft(2, '0');
    return "${two(date.hour)}:${two(date.minute)}";
  }

  String getStatus() {
    final now = DateTime.now();
    final diff = widget.exam.dateTime.difference(now).inDays;
    if (diff < 0) return "поминат";
    if (diff <= 5) return "наскоро";
    return "престојен";
  }

  Color statusColor(String s) {
    switch (s) {
      case "поминат":
        return Colors.grey.shade400;
      case "наскоро":
        return const Color(0xFFFF9500);
      default:
        return const Color(0xFF007AFF);
    }
  }

  String timeRemaining() {
    final now = DateTime.now();
    final diff = widget.exam.dateTime.difference(now);
    final days = diff.inDays;
    final hours = diff.inHours % 24;
    if (diff.isNegative) {
      return "${days.abs()} дена, ${hours.abs()} часа";
    } else {
      return "${days.abs()} дена, ${hours.abs()} часа";
    }
  }

  @override
  Widget build(BuildContext context) {
    final date = formatDate(widget.exam.dateTime);
    final time = formatTime(widget.exam.dateTime);
    final status = getStatus();
    final isFull = widget.exam.registered >= widget.exam.capacity;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.exam.subjectName),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              decoration: BoxDecoration(
                color: statusColor(status).withOpacity(0.12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                status.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: statusColor(status),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Text(
              "Предмет: ${widget.exam.subjectName}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 18, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  date,
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.access_time, size: 18, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  time,
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.location_on_outlined,
                    size: 18, color: Colors.grey),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    widget.exam.rooms.join(', '),
                    style:
                    const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.timer_outlined, size: 18, color: Colors.grey),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    "Преостанато време: ${timeRemaining()}",
                    style: const TextStyle(
                        fontSize: 16, color: Colors.black87),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            Row(
              children: [
                const Icon(Icons.people, color: Color(0xFF007AFF)),
                const SizedBox(width: 6),
                Text(
                  "Пријавени: ${widget.exam.registered} / ${widget.exam.capacity}",
                  style: TextStyle(
                    color: isFull ? Colors.red : Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            if (isFull)
              const Padding(
                padding: EdgeInsets.only(top: 6),
                child: Text(
                  "Просторијата е полна!",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

            const SizedBox(height: 30),

            if (status != "поминат") ...[
              Center(
                child: Text(
                  going == null
                      ? "Дали планирате да присуствувате на испитот?"
                      : going == true
                      ? "Ќе присуствувате на испитот."
                      : "Не планирате да одите.",
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: (isFull || going != null)
                        ? null
                        : () {
                      setState(() {
                        widget.exam.registered++;
                        going = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: going == true
                          ? Colors.grey.shade400
                          : const Color(0xFF007AFF),
                      foregroundColor: Colors.white,
                      disabledBackgroundColor: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: const Icon(Icons.check),
                    label: const Text("Да"),
                  ),
                  ElevatedButton.icon(
                    onPressed: (going != null)
                        ? null
                        : () {
                      setState(() {
                        going = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: going == false
                          ? Colors.grey.shade400
                          : const Color(0xFFE5E5EA),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: const Icon(Icons.close),
                    label: const Text("Не"),
                  ),
                ],
              ),
            ] else
              const Text(
                "Испитот е веќе поминат.",
                style: TextStyle(color: Colors.grey),
              ),
          ],
        ),
      ),
    );
  }
}
