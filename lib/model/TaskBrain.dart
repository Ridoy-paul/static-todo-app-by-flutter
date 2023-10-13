class Task {
  String? title;
  DateTime? createdDateTime, updatedDateTime;
  int? readStatus;

  Task({
    required this.title,
    required this.createdDateTime,
    required this.updatedDateTime,
    this.readStatus = 0,
  });

  static List<Task> taskList() {
    return [];
  }
}
