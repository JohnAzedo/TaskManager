import 'package:flutter/cupertino.dart';

class Category {
  int id;
  String name;
  String color;
  int countTodo;
  int iconCode;

  Category({this.id, this.name = "All", this.color, this.iconCode, this.countTodo});

  Category.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        color = json['color'],
        iconCode = json['icon_code'],
        countTodo = json['count_todos'];
}
