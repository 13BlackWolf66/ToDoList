import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list/data/database.dart';
import 'package:to_do_list/dialog_box.dart';
import 'package:to_do_list/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myBox = Hive.box('mybox');
  TodoDataBase db = TodoDataBase();
  final controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.listTodo[index][1] = !db.listTodo[index][1];
    });
    db.updateData();
  }

  void addNewTask() {
    setState(() {
      (controller.text.isNotEmpty)
          ? db.listTodo.add([controller.text, false])
          : 0;
    });
    Navigator.of(context).pop();
    controller.clear();
    db.updateData();
  }

  void deleteTask(int index) {
    setState(() {
      db.listTodo.removeAt(index);
    });
    db.updateData();
  }

  void createTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: controller,
          onAdd: () => addNewTask(),
          onCanceled: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  void initState() {
    (myBox.get("TODOLIST") == null) ? db.createInitialData() : db.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text(
          'TO DO LIST',
          style: GoogleFonts.rubik(fontSize: 25),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.amber[700],
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createTask();
        },
        backgroundColor: Colors.amber[700],
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.listTodo.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.listTodo[index][0],
            onChanged: (value) => checkBoxChanged(value, index),
            taskCompleted: db.listTodo[index][1],
            deleteTask: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
