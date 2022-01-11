
import 'package:flutter/material.dart';
import 'package:todos/ui/task_po.dart';

class TaskDialog extends StatefulWidget {
  @override
  State<TaskDialog> createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
final TextEditingController controller = new TextEditingController();

@override
Widget build(BuildContext context) {
  return SimpleDialog(
    title: Text('Nova tarefa'),
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 8.0
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(labelText: 'Texto'),
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
            child: Text('Adicionar'),
            onPressed: () {
              TaskPO task = new TaskPO(text: controller.text, visible: false, done: false);
              Navigator.pop(context, task);
            },
          ),
        ),
      )
    ],
  );
}
}