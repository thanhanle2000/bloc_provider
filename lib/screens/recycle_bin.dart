import 'package:flutter/material.dart';
import 'package:todo_app/blocs/bloc_export.dart';
import 'package:todo_app/blocs/task_blocs/tasks_state.dart';

import '../widgets/list_task.dart';
import 'my_drawer.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});
  static const id = 'recycle_bin_screen';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (c, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Recycle Bin'),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
        ),
        drawer: const MyDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(label: Text('${state.removedTask.length} task')),
            ),
            ListStask(
              taskList: state.removedTask,
            )
          ],
        ),
      );
    });
  }
}
