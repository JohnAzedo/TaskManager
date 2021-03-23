import 'package:todos/models/categories.dart';
import 'package:todos/repositories/repository.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

class CategoryRepository extends Repository{
  final String baseUrl = "categories";

  Future<List<Category>> fetchAll() async {
    final Response response = await dio.get("$ipAddress/$baseUrl");
    final List<Category> categories = [];
    for (dynamic json in response.data) {
      categories.add(Category.fromJson(json));
    }
    return categories;
  }
}