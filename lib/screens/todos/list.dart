import 'package:flutter/material.dart';
import 'package:todos/components/NoAppBar.dart';
import 'package:todos/models/todos.dart';

class ListTodo extends StatefulWidget{
  final List<Todo> todos = [];

  @override
  _ListTodoState createState() => _ListTodoState();
}

class _ListTodoState extends State<ListTodo> {
  @override
  Widget build(BuildContext context) {
    widget.todos.add(Todo('Clear bedroom', false));
    widget.todos.add(Todo('Study math', false));
    widget.todos.add(Todo('Study flutter', true));

    return Scaffold(
      appBar: NoAppBar(
        title: 'Todos'
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

      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorDark,
        child: Icon(Icons.add),
        onPressed: (){},
      ),
    );
  }
}

class ItemTodo extends StatefulWidget {
  final Todo _todo;
  ItemTodo(this._todo);

  @override
  _ItemTodoState createState() => _ItemTodoState();
}

class _ItemTodoState extends State<ItemTodo> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: CheckboxListTile(
        title: Text(widget._todo.text),
        value: widget._todo.done,
        onChanged: (bool value) {
          setState(() {
            widget._todo.done = value;
          });
        },
      ),
    );
  }
}