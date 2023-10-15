import 'package:flutter/material.dart';
import 'model/TaskBrain.dart';

class AddToDoModal extends StatefulWidget {
  const AddToDoModal({
    super.key,
    required this.onAddTap,
  });

  final Function(Task) onAddTap; // callback function initialized.

  @override
  State<AddToDoModal> createState() => _AddToDoModalState();
}

class _AddToDoModalState extends State<AddToDoModal> {

  final TextEditingController taskTEController = TextEditingController(); // for textField
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Define Individual form key

  void _submitAddForm() {
    Task task = Task(
      title: taskTEController.text.trim(),
      createdDateTime: DateTime.now(),
      updatedDateTime: DateTime.now(),
    );
    widget.onAddTap(task); // Callback function call from add new page to home screen.
    Navigator.pop(context);
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
                  "Add New Task",
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge,
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
                controller: taskTEController,
                //keyboardType: TextInputType.multiline,
                maxLines: 6,
                decoration: const InputDecoration(
                  hintText: "Enter Your Task",
                  border: OutlineInputBorder(),
                ),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Please Enter any Task";
                  }
                  return null;
                },
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
                  if (_formKey.currentState!.validate()) {
                    _submitAddForm();
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    )),
                child: const Text("Add Task"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
