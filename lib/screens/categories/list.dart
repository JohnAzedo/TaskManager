import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todos/components/hexColor.dart';
import 'package:todos/components/noAppBar.dart';
import 'package:todos/models/categories.dart';
import 'package:todos/repositories/categories.dart';
import 'package:todos/screens/categories/components/customCard.dart';

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
        debugPrint(categories.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(24.0),
        child: NoAppBar(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 8.0,
            ),
            child: Text(
              'Lists',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
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
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                shrinkWrap: true,
                itemCount: categories.length,
                itemBuilder: (BuildContext context, index) {
                  Category category = categories[index];
                  return CustomCard(
                    icon: IconData(category.icon_code, fontFamily: 'MaterialIcons'),
                    title: category.name,
                    subtitle: "0 tasks",
                    iconColor: HexColor(category.color),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(CupertinoIcons.add),
      ),
    );
  }
}
