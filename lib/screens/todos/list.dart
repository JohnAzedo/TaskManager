import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todos/screens/todos/components/dialog.dart';
import 'package:todos/components/noAppBar.dart';
import 'package:todos/models/todos.dart';
import 'package:todos/repositories/todos.dart';

class ListTodo extends StatefulWidget {
  @override
  _ListTodoState createState() => _ListTodoState();
}

class _ListTodoState extends State<ListTodo> {
  final TodoRepository repository = TodoRepository();
  List<Todo> todos = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    return repository.fetchAll().then((todos) {
      setState(() {
        this.todos = todos;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NoAppBar(title: 'Todos'),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RefreshIndicator(
            onRefresh: _getData,
            child: ListView.builder(
                itemCount: todos.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final Todo todo = todos[index];
                  return ItemTodo(todo);
                }),
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorDark,
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return TodoDialog();
            },
          ).then((todo) {
            repository.create(todo).then((response){
              setState(() {
                todos.add(response);
              });
            });
          });
        },
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
  final TodoRepository repository = TodoRepository();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: CheckboxListTile(
        title: Text(widget._todo.text),
        value: widget._todo.done,
        onChanged: (bool value) {
          setState(() {
            widget._todo.done = value;
            repository.updateDone(widget._todo);
          });
        },
      ),
    );
  }
}
