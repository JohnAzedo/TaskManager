import 'package:flutter/cupertino.dart';

class Category {
  int id;
  String name;
  String color;
  String icon;

  Category({this.id, this.name = "All", this.color, this.icon});

  Category.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        color = json['color'],
        icon = json['icon'];
}
