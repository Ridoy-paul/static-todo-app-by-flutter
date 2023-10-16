class Task {
  String? title;
  DateTime? createdDateTime, updatedDateTime;
  bool? readStatus;

  Task({
    required this.title,
    required this.createdDateTime,
    required this.updatedDateTime,
    this.readStatus = false,
  });

  static List<Task> taskList() {
    return [];
  }
}
