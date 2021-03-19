import 'package:flutter/material.dart';

class NoAppBar extends AppBar {
  NoAppBar({String title})
      : super(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: Text(
            title,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          elevation: 0.0,
        );
}
