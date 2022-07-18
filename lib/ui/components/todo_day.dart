import 'package:flutter/material.dart';
import 'package:todos/ui/colors.dart';
import 'package:todos/ui/task_screen.dart';

class TodoDay extends StatelessWidget {
  final String date;

  TodoDay({required this.date});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0, top: 24.0),
        child: Row(
          children: [
            Text(this.date, style: _getDateStyle(),)
          ],
        ),
      ),
      visible: true,
    );
  }

  TextStyle _getDateStyle() {
    return TextStyle(
      color: CustomColors.primary,
      fontWeight: FontWeight.bold,
      fontSize: 16.0
    );
  }
}
