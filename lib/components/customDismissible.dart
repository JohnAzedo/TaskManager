import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDismissible extends Dismissible {
  CustomDismissible(
      {@required Key key,
      @required Widget child,
      @required void onDismissed(dismissDirection)})
      : super(
          onDismissed: onDismissed,
          key: key,
          child: child,
          background: Container(
            alignment: AlignmentDirectional.centerStart,
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),
          secondaryBackground: Container(
            alignment: AlignmentDirectional.centerEnd,
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),
        );
}
