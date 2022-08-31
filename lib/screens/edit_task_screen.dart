import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/services/guid_gen.dart';

import '../blocs/task_blocs/tasks_event.dart';
import '../blocs/task_blocs/tasks_bloc.dart';
import '../models/task.dart';

class EditStaskScreen extends StatefulWidget {
  final Task oldTask;
  const EditStaskScreen({
    Key? key,
    required this.oldTask,
  }) : super(key: key);

  @override
  State<EditStaskScreen> createState() => _EditStaskScreenState();
}

class _EditStaskScreenState extends State<EditStaskScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: widget.oldTask.title);
    TextEditingController descriptionController =
        TextEditingController(text: widget.oldTask.description);
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Add Task',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: TextField(
              autofocus: true,
              controller: titleController,
              decoration: const InputDecoration(
                  label: Text('Title'), border: OutlineInputBorder()),
            ),
          ),
          TextField(
            autofocus: true,
            minLines: 3,
            maxLines: 5,
            controller: descriptionController,
            decoration: const InputDecoration(
                label: Text('Description'), border: OutlineInputBorder()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel')),
              ElevatedButton(
                  onPressed: () {
                    var editedTask = Task(
                        title: titleController.text,
                        description: descriptionController.text,
                        id: widget.oldTask.id,
                        isFavorite: widget.oldTask.isFavorite,
                        date: DateTime.now().toString());
                    context.read<TasksBloc>().add(
                        EditTask(oldTask: widget.oldTask, newTask: editedTask));
                    Navigator.pop(context);
                  },
                  child: const Text('Save'))
            ],
          ),
        ],
      ),
    );
  }
}
