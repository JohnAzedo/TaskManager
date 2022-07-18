import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:todos/ui/colors.dart';
import 'package:todos/ui/components/todo_card.dart';
import 'package:todos/ui/components/todo_listitem.dart';
import 'package:todos/ui/task_po.dart';
import 'package:todos/ui/task_viewmodel.dart';

import 'components/search_field.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends  State<TaskScreen> {
  final TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<TaskViewModel>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 20.0,
        title: Text(
          'Suas tarefas',
          style: TextStyle(
              color: CustomColors.primary, fontWeight: FontWeight.bold, fontSize: 24.0),
        ),
        backgroundColor: CustomColors.background,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            SearchField(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: ValueListenableBuilder(
                valueListenable: vm.tasks,
                builder: (BuildContext context, value, Widget? child) {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: vm.tasks.value.length,
                    itemBuilder: (context, index) {
                      var element = vm.tasks.value.entries.elementAt(index);
                      return TodoListItem(entry: element, vm: vm);
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
