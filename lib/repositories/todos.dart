import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todos/models/todos.dart';

class TodoRepository {
  String ipAddress = "http://192.168.1.12:8000";

  Future<List<Todo>> fetchAll() async {
    Response response = await new Dio().get("${ipAddress}/todos/");
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
      "${ipAddress}/${todo.id}",
      data: jsonEncode(data),
    );
  }

  Future<Todo> create(Todo todo) async {
    Map<String, dynamic> data = {
      "text": todo.text,
    };
    Response response = await new Dio()
        .post("${ipAddress}/todos/", data: jsonEncode(data));

    return Todo.fromJson(response.data);
  }

  Future<void> delete(Todo todo) async {
    await new Dio().delete("${ipAddress}/todos/${todo.id}");
  }
}
