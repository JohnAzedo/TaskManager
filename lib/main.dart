import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todos/screens/categories/list.dart';
import 'package:todos/screens/todos/list.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // status bar color
    statusBarBrightness: Brightness.dark, //status bar brigtness
    // statusBarIconBrightness: Brightness.dark, //status barIcon Brightness
  ));
  runApp(TodosApp());
}

class TodosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListCategory(),
      theme: ThemeData(
        primaryColor: Color(0xff5786ff),
        primaryColorLight: Color(0xff5786ff),
        backgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
    );
  }
}
