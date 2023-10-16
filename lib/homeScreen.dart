import 'package:flutter/material.dart';
import 'add_new_task_modal.dart';
import 'model/TaskBrain.dart';
import 'task_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Task> taskList = Task.taskList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd9dae0),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Task Management System"),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
          child: ListView.builder(
            itemCount: taskList.length,
            itemBuilder: (BuildContext context, index) {
              return TaskItem(
                index: index,
                taskInfo: taskList[index],
                onDeleteTask: (int? index) {
                  deleteTaskItem(index!);
                },
                onTaskUpdateFromTaskItem: (String taskTitle) {
                  updateTask(index, taskTitle);
                },
              );


            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            // Set this to true to make the content scrollable
            context: context,
            builder: (BuildContext context) {
              return AddToDoModal(
                onAddTap: (Task task) {
                  addTask(task);
                },
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  // After added callback function to update state.
  void addTask(Task task) {
    setState(() {
      taskList.add(task);
    });
  }

  void deleteTaskItem(int index) {
    setState(() {
      taskList.removeAt(index);
    });
  }

  void updateTask(int index, String title) {
    setState(() {
      taskList[index].title = title;
    });
  }


}
