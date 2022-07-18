import 'package:flutter/material.dart';
import 'package:todos/ui/task_screen.dart';

import '../colors.dart';
import '../task_po.dart';
import '../task_viewmodel.dart';

class TodoCard extends StatelessWidget {
  final TaskPO task;
  final TaskViewModel vm;
  final int index;
  final String day;

  const TodoCard({required this.task, required this.vm, required this.index, required this.day});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: task.visible,
      child: GestureDetector(
        onTap: () => vm.changeStatus(this.day, this.index),
        child: Card(
          elevation: 4.0,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 8,
                  children: [
                    Badge(
                      text: task.category ?? "",
                      textColor: CustomColors.accent,
                      backgroundColor: CustomColors.accentLight,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  task.text,
                  style: getStyle(),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  formatTime(task.deadline ?? DateTime.now()),
                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle getStyle(){
    if(task.done) return TextStyle(color: CustomColors.primary, decoration: TextDecoration.lineThrough);

    return TextStyle(color: CustomColors.primary);
  }
}

class Badge extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final Color textColor;

  Badge(
      {required this.text,
      required this.textColor,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(4.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Text(
          this.text,
          style: TextStyle(color: textColor, fontSize: 12.0),
        ),
      ),
    );
  }
}

TextStyle lineThroughStyle() {
  return TextStyle(
      color: Colors.white,
      fontSize: 16.0,
      decoration: TextDecoration.lineThrough);
}

String formatDate(DateTime datetime) {
  return "${datetime.day.toString().padLeft(2, '0')}/${datetime.month.toString().padLeft(2, '0')}/${datetime.year}";
}

String formatTime(DateTime datetime) {
  return "${datetime.hour.toString().padLeft(2, '0')}:${datetime.minute.toString().padLeft(2, '0')}";
}
