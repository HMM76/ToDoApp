import 'package:flutter/material.dart';

typedef void DeleteTaskFunction(int index);

class ToDoItem extends StatelessWidget {
  final int index;
  final List todoList;
  final Function(bool?)? onChanged;
  final DeleteTaskFunction onDelete;

  ToDoItem({
    required this.index,
    required this.todoList,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final taskName = todoList[index][0];
    final taskCompleted = todoList[index][1];

    return Padding(
      padding: const EdgeInsets.all(30),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Row(
          children: [
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              activeColor: Colors.black,
            ),
            Text(
              taskName,
              style: TextStyle(
                  decoration:
                      taskCompleted ? TextDecoration.lineThrough : TextDecoration.none),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: MaterialButton(
                onPressed: () => onDelete(index),
                child: Icon(Icons.delete),
                color: Colors.red,
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
