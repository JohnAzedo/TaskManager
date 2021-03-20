import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todos/models/todos.dart';

class TodoRepository {
  Future<List<Todo>> fetchAll() async {
    Response response = await new Dio().get("http://172.19.0.1:8000/todos/");
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

    await new Dio().patch(
      "http://172.19.0.1:8000/todos/${todo.id}",
      data: jsonEncode(data),
    );
  }

  Future<Todo> create(Todo todo) async {
    Map<String, dynamic> data = {
      "text": todo.text,
    };
    Response response = await new Dio()
        .post("http://172.19.0.1:8000/todos/", data: jsonEncode(data));

    return Todo.fromJson(response.data);
  }

  Future<void> delete(Todo todo) async {
    await new Dio().delete("http://172.19.0.1:8000/todos/${todo.id}");
  }
}
