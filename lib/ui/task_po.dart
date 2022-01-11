// PO means Presenter Object
import 'package:todos/domain/task.dart';

class TaskPO {
  int? id;
  String text;
  bool done;
  bool visible;

  TaskPO({this.id, required this.text, required this.done, required this.visible});

  TaskPO.fromTask(Task task):
      id = task.id,
      text = task.text,
      done = task.done,
      visible = true;

  Task toTask() => Task(id: id, text: this.text, done: this.done);
}