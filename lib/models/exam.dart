class Exam {
  final String subjectName;
  final DateTime dateTime;
  final List<String> rooms;
  final bool isPassed;
  final int capacity;
  int registered;

  Exam({
    required this.subjectName,
    required this.dateTime,
    required this.rooms,
    required this.isPassed,
    required this.capacity,
    required this.registered,
  });
}
