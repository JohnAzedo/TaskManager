import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todos/components/customDismissible.dart';
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

  void deleteTodo(index, Todo todo) {
    setState(() {
      todos.removeAt(index);
      repository.delete(todo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NoAppBar(),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RefreshIndicator(
            onRefresh: _getData,
            child: ListView.builder(
                itemCount: todos.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final Todo todo = todos[index];
                  return ItemTodo(
                    todo: todo,
                    repository: repository,
                    onDismissed: () => deleteTodo(index, todo),
                  );
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
            repository.create(todo).then((response) {
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
  final Todo todo;
  final TodoRepository repository;
  final VoidCallback onDismissed;

  ItemTodo({this.todo, this.repository, this.onDismissed});

  @override
  _ItemTodoState createState() => _ItemTodoState();
}

class _ItemTodoState extends State<ItemTodo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: CustomDismissible(
        key: Key(widget.todo.id.toString()),
        onDismissed: (direction) => widget.onDismissed(),
        child: Card(
          margin: EdgeInsets.all(0),
          child: CheckboxListTile(
            title: Text(widget.todo.text),
            value: widget.todo.done,
            onChanged: (bool value) {
              setState(() {
                widget.todo.done = value;
                widget.repository.updateDone(widget.todo);
              });
            },
          ),
        ),
      ),
    );
  }
}
