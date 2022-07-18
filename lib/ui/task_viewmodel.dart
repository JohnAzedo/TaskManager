

import 'package:flutter/material.dart';
import 'package:todos/domain/order_task_usecase.dart';
import 'package:todos/domain/task_usecase.dart';
import 'package:todos/ui/task_po.dart';

class TaskViewModel extends ChangeNotifier {
  final TaskUseCase useCase;
  final OrderTaskUseCase orderTaskUseCase;

  var tasks = ValueNotifier<Map<String, List<TaskPO>>>(Map());

  TaskViewModel({required this.useCase, required this.orderTaskUseCase}){
    getTasks();
  }

  void getTasks() async {
    var result = await orderTaskUseCase.invoke();
    result.forEach((key, value){
      var listPo = value.map((element)  => TaskPO.fromTask(element)).toList();
      tasks.value[key] = listPo;
    });
    notifyListeners();
  }

  // void changeStatus(int index) async {
  //   Task? task = tasks.value[index].toTask();
  //   task = await useCase.changeStatus(task);
  //
  //   if(task!=null){
  //     tasks.value[index] = TaskPO.fromTask(task);
  //     notifyListeners();
  //   }
  // }

  // void deleteItem(int index) async {
  //   Task task = tasks.value[index].toTask();
  //   bool removed = await useCase.delete(task.id!);
  //   if(removed){
  //     tasks.value.removeAt(index);
  //     notifyListeners();
  //   }
  // }
  //
  // void createItem(TaskPO taskPO) async {
  //   Task? task = await useCase.create(taskPO.text);
  //   if(task!=null){
  //     tasks.value.add(TaskPO.fromTask(task));
  //     notifyListeners();
  //   }
  // }
  // void filterList(String text){
  //   tasks.value.forEach((element) => element.visible = element.text.startsWith(text) || filterByCategory(element, text));
  //   notifyListeners();
  // }
  //
  // bool filterByCategory(TaskPO task, String text) {
  //   final category = task.category;
  //   if(category != null) {
  //     return category.startsWith(text);
  //   }
  //   return false;
  // }
}