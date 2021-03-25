import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:todos/components/customDismissible.dart';
import 'package:todos/components/hexColor.dart';
import 'package:todos/components/noTitleAppBar.dart';
import 'package:todos/models/categories.dart';
import 'package:todos/screens/todos/components/dialog.dart';
import 'package:todos/models/todos.dart';
import 'package:todos/repositories/todos.dart';

class ListTodo extends StatefulWidget {
  final Category category;
  ListTodo(this.category);

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
    return repository.fetchAll(widget.category).then((todos) {
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
      backgroundColor: HexColor(widget.category.color),
      appBar: NoTitleAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 64.0,
              vertical: 24.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                        IconData(
                          widget.category.iconCode,
                          fontFamily: CupertinoIcons.iconFont,
                          fontPackage: CupertinoIcons.iconFontPackage,
                        ),
                      size: 32.0,
                      color: HexColor(widget.category.color),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(50.0))),
                ),
                Text(
                  widget.category.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "${widget.category.countTodo} tasks",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                )
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Card(
                margin: const EdgeInsets.all(0.0),
                semanticContainer: true,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 0.0,
                    vertical: 32.0,
                  ),
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
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32.0),
                    bottom: Radius.zero,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
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
    return CustomDismissible(
      key: Key(widget.todo.id.toString()),
      onDismissed: (direction) => widget.onDismissed(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 0.0,
          horizontal: 16.0
        ),
        child: CheckboxListTile(
          title: Text(
            widget.todo.text,
            style: TextStyle(
              fontSize: 20.0
            ),
          ),
          value: widget.todo.done,
          onChanged: (bool value) {
            setState(() {
              widget.todo.done = value;
              widget.repository.updateDone(widget.todo);
            });
          },
        ),
      ),
    );
  }
}
