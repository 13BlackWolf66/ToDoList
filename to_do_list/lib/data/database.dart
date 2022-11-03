import 'package:hive/hive.dart';

class TodoDataBase{
  List listTodo = [];
  final myBox = Hive.box('mybox');

  void createInitialData (){
    listTodo = [];
  }

  void loadData(){
    listTodo = myBox.get('TODOLIST');
  }
  void updateData(){
   myBox.put('TODOLIST', listTodo);
  }
}