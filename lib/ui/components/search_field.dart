

import 'package:flutter/material.dart';
import 'package:todos/ui/colors.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: TextField(
        cursorColor: CustomColors.primary,
        decoration: const InputDecoration(
          filled: true,
          fillColor: CustomColors.accentLight,
          suffixIcon: Icon(
            Icons.search,
            color: CustomColors.primary,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide.none,
          ),
          hintText: "Pesquisar",
          contentPadding:
          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        ),
        keyboardType: TextInputType.name,
        onChanged: (String text) => { },
      ),
    );
  }


}