import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoAppBar extends AppBar {
  NoAppBar()
      : super(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          // here the desired height
          // leading: GestureDetector(
          //   onTap: (){},
          //   child: Padding(
          //     padding: const EdgeInsets.all(24.0),
          //     child: Icon(
          //       CupertinoIcons.square_split_2x2_fill
          //     ),
          //   ),
          // ),
          // title: Text(
          //   title,
          //   style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          // ),
          elevation: 0.0,
        );
}
