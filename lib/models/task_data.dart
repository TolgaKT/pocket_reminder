import 'package:flutter/material.dart';
import 'package:pocket_reminder/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier{
  List<Task> _tasks = [];

  List<Task> _taskstom = [];

  int get taskCount{
    return _tasks.length;
  }

  int get tomTaskCount{
    return _taskstom.length;
  }

  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_tasks);
  }

  UnmodifiableListView<Task> get tomTask{
    return UnmodifiableListView(_taskstom);
  }

  void addTask(String newTaskTitle, DateTime newTaskDate, TimeOfDay newTaskTime, String newTextDesc){
    final task = Task(name: newTaskTitle, month: newTaskDate.month.toString(),day: newTaskDate.day.toString(),year: newTaskDate.year.toString(),hour: newTaskTime.hour.toString(),minute: newTaskTime.minute.toString(),
      desc: newTextDesc
    );

    if(task.day == DateTime.now().day.toString() && task.month == DateTime.now().month.toString() && task.year == DateTime.now().year.toString()){
      _tasks.add(task);

    }
    else{
      _taskstom.add(task);
    }


    notifyListeners();
  }

  void updateTask(Task task){
    task.toggleDOne();
    notifyListeners();
  }

  void deleteTaskToday(Task task){
    _tasks.remove(task);
    notifyListeners();
  }

  void deleteTaskTom(Task task){
    _taskstom.remove(task);
    notifyListeners();
  }




}