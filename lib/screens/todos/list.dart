import 'package:flutter/material.dart';
import 'package:todos/models/todos.dart';

class ListTodo extends StatefulWidget{
  final List<Todo> todos = [];

  @override
  _ListTodoState createState() => _ListTodoState();
}

class _ListTodoState extends State<ListTodo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: widget.todos.length,
            itemBuilder: (context, index) {
              final Todo todo = widget.todos[index];
              return ItemTodo(todo);
            })
      ),
    );
  }
}

class ItemTodo extends StatelessWidget {
  final Todo _todo;

  ItemTodo(this._todo);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: CheckboxListTile(
        title: Text(_todo.text),
        value: _todo.done,
        onChanged: (bool value) {

        },
      ),
    );
  }
}