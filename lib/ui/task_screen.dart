import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:todos/ui/task_dialog.dart';
import 'package:todos/ui/task_po.dart';
import 'package:todos/ui/task_viewmodel.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<TaskViewModel>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return TaskDialog();
            },
          ).then(
            (task) => vm.createItem(task),
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(
          'Todo App',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: controller,
                onChanged: (String text){
                  vm.filterList(text);
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                  labelText: "Pesquisar",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ValueListenableBuilder(
                valueListenable: vm.tasks,
                builder: (BuildContext context, value, Widget? child) {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: vm.tasks.value.length,
                    itemBuilder: (context, index) {
                      return ItemView(
                          task: vm.tasks.value[index], index: index, vm: vm);
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

class ItemView extends StatelessWidget {
  final TaskPO task;
  final int index;
  final TaskViewModel vm;

  const ItemView(
      {Key? key, required this.task, required this.index, required this.vm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: task.visible,
      child: Dismissible(
        key: Key(task.id.toString()),
        onDismissed: (direction) => vm.deleteItem(index),
        background: Container(
          alignment: AlignmentDirectional.centerStart,
          color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
        child: GestureDetector(
          onTap: () {
            vm.changeStatus(index);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Container(
              child: Text(task.text,
                  style: task.done ? lineThroughStyle() : normalStyle()),
            ),
          ),
        ),
      ),
    );
  }
}

TextStyle normalStyle() {
  return TextStyle(color: Colors.black, fontSize: 20.0);
}

TextStyle lineThroughStyle() {
  return TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      decoration: TextDecoration.lineThrough);
}
