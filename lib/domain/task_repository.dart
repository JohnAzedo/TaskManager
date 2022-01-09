import 'package:todos/domain/task.dart';

abstract class TaskRepository {
  Future<int?> create(String text);
  Future<Task?> update(int id, bool status);
  Future<bool> delete(int id);
  Future<List<Task>> getAll();
}