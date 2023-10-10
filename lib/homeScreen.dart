import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd9dae0),
      appBar: AppBar(
        title: const Text("Awesome ToDo"),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
          child: ListView.builder(
            itemCount: 100,
            itemBuilder: (BuildContext context, index) {
              index++;
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
                          child: Text("$index"),
                        ),
                        contentPadding: const EdgeInsets.all(2),
                        title: Text("Hello Todo  sdfj sfk jsfk jsf jks"),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text("17 Jan 2023 8:10:33 AM"),
                        ),
                        trailing: Wrap(
                          alignment: WrapAlignment.start,
                          direction: Axis.vertical,
                          runSpacing: 5,
                          children: [
                            GestureDetector(
                              child: Tooltip(
                                message: "Edit",
                                preferBelow: false,
                                child: const Icon(
                                  Icons.edit_calendar,
                                  color: Colors.red,
                                ),
                              ),
                              // Icon for the button
                              onTap: () {
                                print("Edit todo");
                              },
                            ),
                            GestureDetector(
                              child: Tooltip(
                                message: "Delete",
                                preferBelow: true,
                                child: const Icon(
                                  Icons.delete_forever,
                                  color: Colors.red,
                                ),
                              ),
                              // Icon for the button
                              onTap: () {
                                print("Delete todo");
                              },
                            ),
                          ],
                        ),
                      )),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isScrollControlled: true, // Set this to true to make the content scrollable
            context: context,
            builder: (BuildContext context) {
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add New TODO",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.close),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      //height: MediaQuery.sizeOf(context).height * 0.4,
                      child: TextFormField(
                        //keyboardType: TextInputType.multiline,
                        maxLines: 6,
                        decoration: const InputDecoration(
                          hintText: "Enter Your TODO",
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
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        )),
                        child: const Text("Submit"),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
