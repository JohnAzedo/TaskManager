import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:todos/ui/colors.dart';
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
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 20.0,
        title: Text(
          'Suas tarefas',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.0),
        ),
        backgroundColor: CustomColors.background,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
            //   child: TextField(
            //     controller: controller,
            //     onChanged: (String text) {
            //       vm.filterList(text);
            //     },
            //     decoration: InputDecoration(
            //       contentPadding: EdgeInsets.symmetric(vertical: 8.0),
            //       labelText: "Pesquisar",
            //     ),
            //   ),
            // ),
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
                      return ItemViewCategory(
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

class ItemViewCategory extends StatelessWidget {
  final TaskPO task;
  final int index;
  final TaskViewModel vm;

  const ItemViewCategory(
      {Key? key, required this.task, required this.index, required this.vm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
        child: GestureDetector(
      onTap: () => vm.changeStatus(index),
      child: Card(
        color: CustomColors.primary,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(task.text,
                  style: task.done ? lineThroughStyle() : normalStyle()),
              CardInfoWidget(done: task.done, info: task.category ?? ""),
              CardInfoWidget(
                done: task.done,
                info: formatTime(task.deadline ?? DateTime.now()),
                icon: Icons.access_time_filled,
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class CardInfoWidget extends StatelessWidget {
  final bool done;
  final String info;
  final IconData? icon;

  CardInfoWidget({required this.done, required this.info, this.icon});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: Row(
        children: [
          Visibility(
            child: Icon(icon, color: Colors.white),
            visible: icon != null,
          ),
          Text(
            this.info,
            style: doneStyle(this.done),
          ),
        ],
      ),
      visible: true,
    );
  }

  TextStyle doneStyle(bool taskDone) {
    var color = CustomColors.accent;
    var fontSize = 16.0;
    var fontWeight = FontWeight.bold;

    if (taskDone) color = Colors.white;

    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight
    );
  }
}

TextStyle normalStyle() {
  return TextStyle(color: Colors.white, fontSize: 16.0);
}

TextStyle lineThroughStyle() {
  return TextStyle(
      color: Colors.white,
      fontSize: 16.0,
      decoration: TextDecoration.lineThrough);
}

TextStyle categoryStyle() {
  return TextStyle(color: Colors.blueAccent, fontSize: 16.0);
}

String formatDate(DateTime datetime) {
  return "${datetime.day.toString().padLeft(2, '0')}/${datetime.month.toString().padLeft(2, '0')}/${datetime.year}";
}

String formatTime(DateTime datetime) {
  return "${datetime.hour.toString().padLeft(2, '0')}:${datetime.minute.toString().padLeft(2, '0')}";
}
