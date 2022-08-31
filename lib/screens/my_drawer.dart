import 'package:flutter/material.dart';
import 'package:todo_app/blocs/bloc_export.dart';
import 'package:todo_app/blocs/switch_blocs/switch_event.dart';
import 'package:todo_app/blocs/switch_blocs/switch_state.dart';
import 'package:todo_app/blocs/task_blocs/tasks_state.dart';
import 'package:todo_app/screens/recycle_bin.dart';
import 'package:todo_app/screens/tabs_screen.dart';
import 'package:todo_app/screens/pending_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              color: Colors.grey,
              child: Text(
                'Task Drawer',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            BlocBuilder<TasksBloc, TasksState>(builder: (c, state) {
              return GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed(TabsScreen.id),
                child: ListTile(
                  leading: const Icon(Icons.folder_special),
                  title: const Text('My Task'),
                  trailing: Text('${state.pendingTask.length}'),
                ),
              );
            }),
            const Divider(),
            BlocBuilder<TasksBloc, TasksState>(builder: (c, state) {
              return GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed(RecycleBin.id),
                child: ListTile(
                  leading: const Icon(Icons.delete),
                  title: const Text('Bin'),
                  trailing: Text('${state.removedTask.length}'),
                ),
              );
            }),
            BlocBuilder<SwitchBloc, SwitchState>(builder: (c, state) {
              return Switch(
                  value: state.switchValue,
                  onChanged: (newValue) {
                    newValue
                        ? c.read<SwitchBloc>().add(SwitchOnEvent())
                        : c.read<SwitchBloc>().add(SwitchOffEvent());
                  });
            })
          ],
        ),
      ),
    );
  }
}
