import 'package:flutter/material.dart';
import 'package:todo_app/blocs/bloc_export.dart';
import 'package:todo_app/blocs/task_blocs/tasks_state.dart';
import '../models/task.dart';
import '../widgets/list_task.dart';

// ignore: must_be_immutable
class PendingTaskScreen extends StatelessWidget {
  const PendingTaskScreen({super.key});
  static const id = 'task_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
      List<Task> taskList = state.pendingTask;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Chip(
                label: Text(
                    '${taskList.length} Pending | ${state.completedTask.length} Completed')),
          ),
          ListStask(
            taskList: taskList,
          )
        ],
      );
    });
  }
}
