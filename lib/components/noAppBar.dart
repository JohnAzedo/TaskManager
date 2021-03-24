import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoAppBar extends AppBar {
  NoAppBar(BuildContext context)
      : super(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Theme.of(context).primaryColor,
          ),

          // here the desired height
          actions: [
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 8.0),
                child: Text(
                  "Edit",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ],
          elevation: 0.0,
        );
}
