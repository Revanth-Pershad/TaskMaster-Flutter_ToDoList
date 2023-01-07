import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/components/todo_tile.dart';
import 'package:todo/data/todo.dart';
import 'package:todo/pages/new_task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('myBox');

  ToDo db = ToDo();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  void setChange(bool? value, int index) {
    setState(() {
      db.currList[index][1] = !db.currList[index][1];
    });
    db.updateData();
  }

  void newTask(String str) {
    setState(() {
      db.currList = db.currList +
          [
            [str, false]
          ];
    });
    db.updateData();
  }

  void removeTask(int index) {
    setState(() {
      db.currList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text("TO DO"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: db.currList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.currList[index][0],
            isChecked: db.currList[index][1],
            onChanged: (value) => setChange(value, index),
            deleteTask: (context) => removeTask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewTask(
                addTask: newTask,
              ),
            ),
          );
        },
        backgroundColor: Colors.yellow,
        child: const Icon(Icons.add),
      ),
    );
  }
}
