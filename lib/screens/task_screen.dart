import 'package:Todoey/services/task.dart';
import 'package:Todoey/services/task_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> tasks = [
    Task(name: 'buy milk'),
    Task(name: 'buy egg'),
    Task(name: 'buy 123'),
  ];

  Widget buildButtonSheet(BuildContext context) {
    String newTask;
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.only(left: 40, right: 40, top: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          color: Colors.white,
          shape: BoxShape.rectangle,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                newTask = value;
              },
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  if (newTask != '' && newTask != null)
                    tasks.add(Task(name: newTask));
                  Navigator.pop(context);
                });
              },
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.lightBlueAccent,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        elevation: 3.0,
        onPressed: () {
          showModalBottomSheet(context: context, builder: buildButtonSheet);
        },
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 80,
          ),
          Row(
            children: [
              SizedBox(
                width: 40,
              ),
              Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(75),
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.format_list_bulleted,
                  color: Colors.lightBlueAccent,
                  size: 40,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 20, bottom: 5),
            child: Text(
              'Todoey',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 50,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(
              '${tasks.length} Tasks',
              style: TextStyle(
                color: Colors.white,
                // fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0)),
                color: Colors.white,
              ),
              child: TaskList(
                tasks: tasks,
                checkboxCallback: (bool value, int index) {
                  setState(() {
                    tasks[index].isDone = value;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
