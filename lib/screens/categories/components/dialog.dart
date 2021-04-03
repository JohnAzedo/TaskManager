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
  String selectedDropDownItem = 'Azul';

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
                    value: selectedDropDownItem,
                    onChanged: (String value) {
                      setState(() {
                        selectedDropDownItem = value;
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
