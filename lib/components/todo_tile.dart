import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool? isChecked;
  final Function(bool?)? onChanged;
  final Function(BuildContext) deleteTask;

  const ToDoTile({
    super.key,
    required this.taskName,
    required this.isChecked,
    this.onChanged,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(15),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 15, 15, 15),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              // BoxShadow(
              //   color: Colors.grey,
              //   blurRadius: 5.0, // soften the shadow
              //   spreadRadius: 1, //extend the shadow
              //   offset: Offset(
              //     2.5, // Move to right 5  horizontally
              //     2.5, // Move to bottom 5 Vertically
              //   ),
              // )
            ],
          ),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: Checkbox(
                    value: isChecked,
                    onChanged: onChanged,
                  ),
                ),
              ),
              Text(
                taskName,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    decoration: isChecked!
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
