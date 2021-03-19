import 'package:flutter/material.dart';
import 'package:todos/models/todos.dart';
import 'package:todos/repositories/todos.dart';

class TodoDialog extends StatelessWidget {
  final TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('New todo'),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 8.0
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(labelText: 'Text'),
            style: TextStyle(fontSize: 24.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 8.0
          ),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: Text('Add'),
              onPressed: () {
                Todo todo = new Todo(text: controller.text);
                Navigator.pop(context, todo);
              },
            ),
          ),
        )
      ],
    );
  }
}
