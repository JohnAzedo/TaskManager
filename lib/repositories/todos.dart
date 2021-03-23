import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:todos/models/todos.dart';
import 'package:todos/repositories/repository.dart';

class TodoRepository extends Repository{
  final String baseUrl = "todos";

  Future<List<Todo>> fetchAll() async {
    Response response = await dio.get("$ipAddress/$baseUrl");
    final List<Todo> todos = [];
    for (dynamic json in response.data) {
      todos.add(Todo.fromJson(json));
    }
    return todos;
  }

  Future<void> updateDone(Todo todo) async {
    Map<String, dynamic> data = {
      "done": todo.done,
    };

    await dio.patch(
      "$ipAddress/$baseUrl/${todo.id}",
      data: jsonEncode(data),
    );
  }

  Future<Todo> create(Todo todo) async {
    Map<String, dynamic> data = {
      "text": todo.text,
    };
    Response response = await dio
        .post("$ipAddress/$baseUrl", data: jsonEncode(data));
    return Todo.fromJson(response.data);
  }

  Future<void> delete(Todo todo) async {
    await dio.delete("$ipAddress/$baseUrl/${todo.id}");
  }
}
