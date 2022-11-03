import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'home_page.dart';


  void main() async{
    await Hive.initFlutter();
    var box = await Hive.openBox('mybox');
    runApp(const TodoApp());
  }

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}