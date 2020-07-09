import 'package:flutter/material.dart';
import 'package:pocket_reminder/models/task.dart';

class TaskData extends ChangeNotifier{
  List<Task> tasks = [
    Task(name: 'Buy milk',month:'7',day:'7'),
    Task(name: 'Buy eggs',month:'7',day:'7'),
    Task(name: 'Buy water',month:'8',day:'7')

  ];

  int get taskCount{
    return tasks.length;
  }

}