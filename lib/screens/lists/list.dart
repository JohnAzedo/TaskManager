import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todos/components/noAppBar.dart';
import 'package:todos/screens/lists/components/customCard.dart';

class Lists extends StatelessWidget {
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
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              shrinkWrap: true,
              children: [
                CustomCard(
                  icon: CupertinoIcons.book,
                  title: "All",
                  subtitle: "23 tasks",
                  iconColor: Theme.of(context).primaryColor,
                ),
                CustomCard(
                  icon: CupertinoIcons.briefcase,
                  title: "Work",
                  subtitle: "16 tasks",
                  iconColor: Colors.amber,
                )
              ],
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
