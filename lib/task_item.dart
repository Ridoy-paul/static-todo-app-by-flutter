import 'package:flutter/material.dart';
import 'update_task_modal.dart';

class TaskItem extends StatefulWidget {
  final index;
  final taskInfo;

  const TaskItem({
    super.key,
    required this.index,
    required this.taskInfo,
    required this.onDeleteTask,
    required this.onTaskUpdateFromTaskItem,
    required this.onUpdateReadStatus,
  });

  final Function(int) onDeleteTask;
  final Function(String) onTaskUpdateFromTaskItem;
  final Function(bool) onUpdateReadStatus;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        widget.onUpdateReadStatus(widget.taskInfo.readStatus);
      },
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(
            color: Colors.deepPurple, // Border color
            width: 0.7, // Border width
          ),
        ),
        margin: const EdgeInsets.only(bottom: 8),
        child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              leading: CircleAvatar(
                child: Text("${widget.index + 1}"),
              ),
              contentPadding: const EdgeInsets.all(2),
              title: Text(
                "${widget.taskInfo.title}",
                style: TextStyle(
                  decoration: widget.taskInfo.readStatus? TextDecoration.lineThrough : null,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text("${widget.taskInfo.createdDateTime}"),
              ),
              trailing: GestureDetector(
                child: const Tooltip(
                  message: "Edit",
                  preferBelow: false,
                  child: Icon(
                    Icons.edit_calendar,
                    color: Colors.deepPurple,
                  ),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          /*
                        actions: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.close),
                          )
                        ],
                         */
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 4,
                          //title: Text("Actions"),
                          content: SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.2,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      showModalBottomSheet(
                                        backgroundColor: Colors.transparent,
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) {
                                          return UpdateToDoModal(
                                            task: widget.taskInfo,
                                            onTaskUpdate: (String taskTitle) {
                                              widget.onTaskUpdateFromTaskItem(
                                                  taskTitle);
                                            },
                                          );
                                        },
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    )),
                                    child: const Text("Edit"),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 50,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      widget.onDeleteTask(widget.index);
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    )),
                                    child: const Text("Delete"),
                                  ),
                                ),
                              ],
                            ),
                          ));
                    },
                  );
                },
              ),
            )),
      ),
    );
  }
}
