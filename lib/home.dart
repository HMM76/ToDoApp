import 'package:flutter/material.dart';
import 'package:todo/dialog.dart';
import 'package:todo/todoitem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List todoList = [
    ["Do something", false],
    ["Do homework", false],
  ];

  final _controller = TextEditingController();

  void CheckBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = value ?? false;
    });
  }

  void SaveText() {
    setState(() {
      todoList.add([_controller.text, false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
  }

  void CreateTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
            controller: _controller,
            onSave: SaveText,
            onCancel: () => Navigator.of(context).pop());
      },
    );
  }

  void DeleteTask(int index){
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.yellow,
        title: Align(
          alignment: Alignment(0, 1),
          child: Text(
            "TO DO",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
        ),
      ),
      body: ListView.builder(
  itemCount: todoList.length,
  itemBuilder: (context, index) {
    return ToDoItem(
      index: index,
      todoList: todoList,
      onChanged: (value) => CheckBoxChanged(value, index),
      onDelete: DeleteTask,
    );
  },
),
      floatingActionButton: FloatingActionButton(
        onPressed: CreateTask,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.yellow,
      ),
    );
  }
}