import 'package:flutter/material.dart';
import 'add_new_task_modal.dart';
import 'update_task_modal.dart';
import 'model/TaskBrain.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Task> taskList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd9dae0),
      appBar: AppBar(
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
              );


            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
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
        child: Icon(Icons.add),
      ),
    );
  }

  void addTask(Task task) {
    setState(() {
      taskList.add(task);
    });
  }

}

class TaskItem extends StatelessWidget {
  final index;
  final taskInfo;

  const TaskItem({super.key,
    required this.index,
    required this.taskInfo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("$index");
      },
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(
            color: Colors.deepOrange, // Border color
            width: 0.7, // Border width
          ),
        ),
        margin: const EdgeInsets.only(bottom: 8),
        child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              leading: CircleAvatar(
                child: Text("${index + 1}"),
              ),
              contentPadding: const EdgeInsets.all(2),
              title: Text("${taskInfo.title}"),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text("17 Jan 2023 8:10:33 AM"),
              ),
              trailing: GestureDetector(
                child: const Tooltip(
                  message: "Edit",
                  preferBelow: false,
                  child: Icon(
                    Icons.edit_calendar,
                    color: Colors.red,
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
                          content: Container(
                            height:
                                MediaQuery.sizeOf(context).height *
                                    0.2,
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
                                          return const UpdateToDoModal();
                                        },
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100),
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
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100),
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
