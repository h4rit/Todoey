import 'package:Todoey/services/task.dart';
import 'package:flutter/material.dart';
import 'package:Todoey/services/task_tile.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Function checkboxCallback;
  TaskList({this.tasks, this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          text: tasks[index].name,
          isTicked: tasks[index].isDone,
          checkboxCallback: (value) {
            return checkboxCallback(value, index);
          },
        );
      },
      itemCount: tasks.length,
    );
  }
}
