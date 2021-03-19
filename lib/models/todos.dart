import 'package:flutter/cupertino.dart';

class Todo {
  int id;
  String text;
  bool done;

  Todo({this.id, @required this.text, this.done = false});

  Todo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        text = json['text'],
        done = json['done'];
}
