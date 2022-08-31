import 'package:equatable/equatable.dart';

import '../../models/task.dart';

class TasksState extends Equatable {
  final List<Task> pendingTask;
  final List<Task> completedTask;
  final List<Task> farvoriteTask;
  final List<Task> removedTask;
  const TasksState({
    this.pendingTask = const <Task>[],
    this.completedTask = const <Task>[],
    this.farvoriteTask = const <Task>[],
    this.removedTask = const <Task>[],
  });
  @override
  List<Object> get props =>
      [pendingTask, completedTask, farvoriteTask, removedTask];

  Map<String, dynamic> toMap() {
    return {
      'pendingTask': pendingTask.map((e) => e.toMap()).toList(),
      'completedTask': completedTask.map((e) => e.toMap()).toList(),
      'farvoriteTask': farvoriteTask.map((e) => e.toMap()).toList(),
      'removedTask': removedTask.map((e) => e.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
        pendingTask:
            List<Task>.from(map['pendingTask']?.map((e) => Task.fromMap(e))),
        completedTask:
            List<Task>.from(map['completedTask']?.map((e) => Task.fromMap(e))),
        farvoriteTask:
            List<Task>.from(map['farvoriteTask']?.map((e) => Task.fromMap(e))),
        removedTask:
            List<Task>.from(map['removedTask']?.map((e) => Task.fromMap(e))));
  }
}
