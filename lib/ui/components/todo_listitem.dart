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
    return Visibility(
      visible: dayIsVisible(),
      child: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Column(
          children: [
            TodoDay(date: entry.key),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: entry.value.length,
              itemBuilder: (context, index) {
                return TodoCard(
                    task: entry.value[index], vm: vm, day: entry.key, index: index,);
              },
            )
          ],
        ),
      ),
    );
  }

  bool dayIsVisible(){
    var result = false;
    entry.value.forEach((element) {
      if(element.visible){
        result = true;
      }
    });
    return result;
  }

}