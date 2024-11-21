import './task.dart';

class Plan {
  final String name;
  final List<Task> tasks;

  const Plan({this.name = '', this.tasks = const []});

  // Menghitung jumlah tugas yang selesai
  int get completedCount => tasks.where((task) => task.complete).length;

  // Menampilkan pesan tentang tingkat penyelesaian
  String get completenessMessage =>
      '$completedCount out of ${tasks.length} tasks';
}
