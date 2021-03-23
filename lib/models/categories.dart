import 'package:flutter/cupertino.dart';

class Category {
  int id;
  String name;
  String color;
  int icon_code;

  Category({this.id, this.name = "All", this.color, this.icon_code});

  Category.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        color = json['color'],
        icon_code = json['icon_code'];
}
