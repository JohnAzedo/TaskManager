import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:todos/ui/task_po.dart';
import 'package:todos/ui/task_viewmodel.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    final vm = context.watch<TaskViewModel>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          vm.getTasks();
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                  labelText: "Pesquisar",
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
    return GestureDetector(
      onTap: () {
        print(index.toString() + " has changed to " + task.done.toString());
        vm.changeStatus(index);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          child: Text(task.text,
              style: task.done ? lineThroughStyle() : normalStyle()),
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
