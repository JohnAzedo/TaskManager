
import 'package:flutter/material.dart';
import 'package:todos/domain/task.dart';
import 'package:todos/ui/task_po.dart';
import 'package:todos/domain/task_repository.dart';

abstract class TaskUseCase {
  Future<Task?> create(String text);
  Future<Task?> changeStatus(Task task);
  Future<bool> delete(int id);
  Future<List<Task>> fetchAll();
}

class TaskUseCaseImpl implements TaskUseCase {

  final TaskRepository repository;
  TaskUseCaseImpl({ required this.repository });

  @override
  Future<Task?> changeStatus(Task task) async {
    if(task.id == null) throw new ArgumentError("ID is invalid");
    task.changeStatus();
    return await repository.update(task.id!, task.done);
  }

  @override
  Future<Task?> create(String text) async {
    int? id = await repository.create(text);
    if(id == null) throw new ArgumentError("ID wasn't created");
    return Task(id: id, text: text);
  }

  @override
  Future<bool> delete(int id) async {
    return repository.delete(id);
  }

  @override
  Future<List<Task>> fetchAll() async{
    return await repository.getAll();
  }
}