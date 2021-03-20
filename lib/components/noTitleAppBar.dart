import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoTitleAppBar extends AppBar {
  NoTitleAppBar()
      : super(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          leading: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              child: Icon(
                CupertinoIcons.chevron_back,
                size: 32.0,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              child: Icon(
                CupertinoIcons.ellipsis_vertical,
                size: 32.0,
              ),
            )
          ],
          elevation: 0.0,
        );
}
