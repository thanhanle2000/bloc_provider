import 'package:flutter/material.dart';
import 'package:todo_app/widgets/task_tile.dart';
import '../models/task.dart';

class ListStask extends StatelessWidget {
  const ListStask({super.key, required this.taskList});
  final List<Task> taskList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: taskList
              .map((task) => ExpansionPanelRadio(
                  value: task.id,
                  headerBuilder: (context, isOpen) => TaskTile(task: task),
                  body: ListTile(
                    title: SelectableText.rich(TextSpan(children: [
                      const TextSpan(
                          text: 'Text\n',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: task.title),
                      const TextSpan(
                          text: '\n\nDescription\n',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: task.description),
                    ])),
                  )))
              .toList(),
        ),
      ),
    );
  }
}
// Expanded(
//       child: ListView.builder(
//           itemCount: taskList.length,
//           itemBuilder: (c, i) {
//             var task = taskList[i];
//             return TaskTile(task: task);
//           }),
//     );