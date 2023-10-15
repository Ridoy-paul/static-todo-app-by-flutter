import 'package:flutter/material.dart';

class UpdateToDoModal extends StatelessWidget {
  const UpdateToDoModal({
    super.key,
  });

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
              //keyboardType: TextInputType.multiline,
              maxLines: 6,
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
              onPressed: () {},
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
    );
  }
}
