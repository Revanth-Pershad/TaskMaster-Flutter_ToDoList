import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';

class ToDo {
  List currList = [];

  final box = Hive.box('myBox');

  // Run this method if this is the first time ever opening this app
  void createInitialData() {
    currList = [
      ["Welcome to the App!", false]
    ];
  }

  // Load the data from the database
  void loadData() {
    currList = box.get("TODOLIST");
  }

  // Update the data in the data base
  void updateData() {
    box.put("TODOLIST", currList);
  }
}
