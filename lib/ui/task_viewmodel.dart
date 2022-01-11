

import 'package:flutter/material.dart';
import 'package:todos/domain/task.dart';
import 'package:todos/domain/task_usecase.dart';
import 'package:todos/ui/task_po.dart';

class TaskViewModel extends ChangeNotifier {
  final TaskUseCase useCase;
  var tasks = ValueNotifier<List<TaskPO>>([]);

  TaskViewModel({required this.useCase}){
    getTasks();
  }

  void getTasks() async {
    var listOfTasks = await useCase.fetchAll();
    listOfTasks.forEach((element) {
      tasks.value.add(TaskPO.fromTask(element));
    });
    notifyListeners();
  }

  void changeStatus(int index) async {
    Task? task = tasks.value[index].toTask();
    task = await useCase.changeStatus(task);

    if(task!=null){
      tasks.value[index] = TaskPO.fromTask(task);
      notifyListeners();
    }
  }

  void deleteItem(int index) async {
    Task task = tasks.value[index].toTask();
    bool removed = await useCase.delete(task.id!);
    if(removed){
      tasks.value.removeAt(index);
      notifyListeners();
    }
  }

  void createItem(TaskPO taskPO) async {
    Task? task = await useCase.create(taskPO.text);
    if(task!=null){
      tasks.value.add(TaskPO.fromTask(task));
      notifyListeners();
    }
  }

  void filterList(String text){
    tasks.value.forEach((element) => element.visible = element.text.startsWith(text));
    notifyListeners();
  }
}