import "package:flutter/material.dart";

class NewTask extends StatelessWidget {
  final Function(String) addTask;
  const NewTask({super.key, required this.addTask});

  @override
  Widget build(BuildContext context) {
    String currTask = "";
    final myController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add New Task",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(15)),
      //   child: const Text(
      //     "ADD",
      //     style: TextStyle(
      //       fontSize: 18,
      //     ),
      //   ),
      // ),
      body: Container(
        color: Colors.yellow[200],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: const Text(
                      "What is to be done?",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  TextField(
                    controller: myController,
                    onChanged: (value) => {
                      currTask = value,
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Task',
                      fillColor: Colors.black,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                TextButton(
                  onPressed: () {
                    addTask(currTask);
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(
                            2.0,
                            4.0,
                          ),
                          blurRadius: 1.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 40),
                    child: const Text(
                      'Add',
                      style: TextStyle(color: Colors.black, fontSize: 18.0),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
