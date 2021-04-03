import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todos/components/hexColor.dart';
import 'package:todos/components/noAppBar.dart';
import 'package:todos/models/categories.dart';
import 'package:todos/repositories/categories.dart';
import 'package:todos/screens/categories/components/customCard.dart';
import 'package:todos/screens/categories/components/dialog.dart';
import 'package:todos/screens/todos/list.dart';

class ListCategory extends StatefulWidget {
  @override
  _ListCategoryState createState() => _ListCategoryState();
}

class _ListCategoryState extends State<ListCategory> {
  final CategoryRepository repository = CategoryRepository();
  List<Category> categories = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    return repository.fetchAll().then((categories) {
      setState(() {
        this.categories = categories;
      });
    });
  }

  void navigateToTodo(BuildContext context, Category category){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ListTodo(category),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: NoAppBar(context),
      ),
      body: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 8.0,
            ),
            child: Text(
              'Categories ',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 0.0,
            ),
            child: TextField(
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black12,
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: Colors.black38,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(24.0),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(24.0),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 0.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 8.0,
            ),
            child: RefreshIndicator(
              onRefresh: _getData,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 3.0,
                  mainAxisSpacing: 3.0
                ),
                shrinkWrap: true,
                itemCount: categories.length,
                itemBuilder: (BuildContext context, index) {
                  Category category = categories[index];
                  return CustomCard(
                    icon: IconData(
                      category.iconCode,
                      fontFamily: CupertinoIcons.iconFont,
                      fontPackage: CupertinoIcons.iconFontPackage,
                    ),
                    title: category.name,
                    subtitle: "${category.countTodo} tasks",
                    iconColor: HexColor(category.color),
                    onTap: () => navigateToTodo(context, category),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CategoryDialog();
            },
          );
        },
        child: Icon(CupertinoIcons.add),
      ),
    );
  }
}
