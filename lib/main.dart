import 'package:flutter/material.dart';
import 'package:todos/screens/todos/list.dart';

void main() => runApp(TodosApp());

class TodosApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListTodo(),
    );
  }
}

