import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isTicked;
  final String text;
  final Function checkboxCallback;
  TaskTile({this.isTicked, this.text, this.checkboxCallback});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(
          decoration: isTicked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isTicked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
