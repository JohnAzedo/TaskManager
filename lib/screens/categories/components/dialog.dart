import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todos/models/categories.dart';
import 'package:todos/models/todos.dart';
import 'package:todos/repositories/todos.dart';

class CategoryDialog extends StatefulWidget {
  @override
  _CategoryDialogState createState() => _CategoryDialogState();
}

class _CategoryDialogState extends State<CategoryDialog> {
  final TextEditingController controller = new TextEditingController();
  String colorSelected = 'Azul';
  int iconSelected = 62439;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 8.0,
          ),
          child: Column(
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(labelText: 'Name'),
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(
                width: double.infinity,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: colorSelected,
                    onChanged: (String value) {
                      setState(() {
                        colorSelected = value;
                      });
                    },
                    items: <String>['Azul', 'Vermelho', 'Vinho', 'Verde']
                        .map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 20.0),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<int>(
                    value: iconSelected,
                    onChanged: (int value) {
                      setState(() {
                        iconSelected = value;
                      });
                    },
                    items: <int>[62836, 62856, 62433, 62439]
                        .map((int value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Icon(
                          IconData(
                            value,
                            fontFamily: CupertinoIcons.iconFont,
                            fontPackage: CupertinoIcons.iconFontPackage,
                          ),
                        )
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('Create'),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
