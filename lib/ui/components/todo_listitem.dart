import 'package:flutter/material.dart';
import 'package:todos/ui/components/todo_card.dart';
import 'package:todos/ui/components/todo_day.dart';

import '../task_po.dart';
import '../task_viewmodel.dart';

class TodoListItem extends StatelessWidget {

  final MapEntry<String, List<TaskPO>> entry;
  final TaskViewModel vm;

  const TodoListItem({required this.entry, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TodoDay(date: entry.key),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: entry.value.length,
          itemBuilder: (context, index) {
            return TodoCard(
                task: entry.value[index], vm: vm);
          },
        )
      ],
    );
  }

}