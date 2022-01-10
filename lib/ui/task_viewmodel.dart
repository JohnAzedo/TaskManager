

import 'package:flutter/material.dart';
import 'package:todos/ui/task_po.dart';

class TaskViewModel extends ChangeNotifier {

  var tasks = ValueNotifier<List<TaskPO>>([]);

  void getTasks() {
    tasks.value = [
      TaskPO(id: 1, text: "Testing 1", done: true, visible: true),
      TaskPO(id: 2, text: "Testing 2", done: false, visible: true),
      TaskPO(id: 3, text: "Testing 3", done: true, visible: true),
      TaskPO(id: 4, text: "Testing 4", done: false, visible: true),
      TaskPO(id: 5, text: "Testing 5", done: true, visible: true),
      TaskPO(id: 6, text: "Testing 6", done: false, visible: true),
      TaskPO(id: 7, text: "Testing 7", done: true, visible: true),
      TaskPO(id: 8, text: "Testing 8", done: false, visible: true),
      TaskPO(id: 9, text: "Testing 9", done: true, visible: true),
      TaskPO(id: 10, text: "Testing 10", done: false, visible: true),
      TaskPO(id: 11, text: "Testing 11", done: true, visible: true),
      TaskPO(id: 12, text: "Testing 12", done: false, visible: true),
      TaskPO(id: 13, text: "Testing 13", done: true, visible: true),
      TaskPO(id: 14, text: "Testing 14", done: false, visible: true),
      TaskPO(id: 15, text: "Testing 15", done: true, visible: true),
      TaskPO(id: 16, text: "Testing 16", done: false, visible: true),
      TaskPO(id: 17, text: "Testing 17", done: true, visible: true),
      TaskPO(id: 18, text: "Testing 18", done: false, visible: true),
      TaskPO(id: 19, text: "Testing 19", done: true, visible: true),
      TaskPO(id: 20, text: "Testing 20", done: false, visible: true),
      TaskPO(id: 21, text: "Testing 21", done: true, visible: true),
      TaskPO(id: 22, text: "Testing 22", done: false, visible: true),
      TaskPO(id: 23, text: "Testing 23", done: true, visible: true),
      TaskPO(id: 24, text: "Testing 24", done: false, visible: true),
    ];
    notifyListeners();
  }

  void changeStatus(int index){
    tasks.value[index].done = !tasks.value[index].done;
    notifyListeners();
  }
}