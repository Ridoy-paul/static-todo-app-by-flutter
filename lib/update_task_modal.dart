import 'package:flutter/material.dart';
import 'model/TaskBrain.dart';

class UpdateToDoModal extends StatefulWidget {
  const UpdateToDoModal({
    super.key,
    required this.task,
    required this.onTaskUpdate,
  });

  final Task task;
  final Function(String) onTaskUpdate;

  @override
  State<UpdateToDoModal> createState() => _UpdateToDoModalState();
}

class _UpdateToDoModalState extends State<UpdateToDoModal> {

  late TextEditingController taskTitleController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    taskTitleController = TextEditingController(text: widget.task.title);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      //height: MediaQuery.sizeOf(context).height * .9,
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Update Task",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              //height: MediaQuery.sizeOf(context).height * 0.4,
              child: TextFormField(
                controller: taskTitleController,
                //keyboardType: TextInputType.multiline,
                maxLines: 6,
                validator: (String? value) {
                  if(value!.isEmpty) {
                    return "Please Enter any Text";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Enter Your Task",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()) {
                    widget.onTaskUpdate(
                      taskTitleController.text.trim()
                    );
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    )),
                child: const Text("Update"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
