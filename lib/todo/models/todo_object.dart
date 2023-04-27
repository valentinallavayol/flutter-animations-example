import 'package:flutter/material.dart';
import 'package:panzetapp/todo/models/color_choice.dart';
import 'package:uuid/uuid.dart';

class TodoObject {
  TodoObject(this.title, this.icon, ColorChoice choice)
      : tasks = <DateTime, List<TaskObject>>{},
        uuid = const Uuid().v1(),
        color = choice.primary,
        sortID = null,
        gradient = LinearGradient(
          colors: choice.gradient,
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        );

  TodoObject.import(
    String uuidS,
    this.title,
    int this.sortID,
    ColorChoice color,
    this.icon,
    this.tasks,
  )   : color = color.primary,
        gradient = LinearGradient(
          colors: color.gradient,
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        uuid = uuidS;

  final String uuid;
  final int? sortID;
  final String title;
  final Color color;
  final LinearGradient gradient;
  final IconData icon;
  final Map<DateTime, List<TaskObject>> tasks;

  int taskAmount() {
    var amount = 0;
    for (final list in tasks.values) {
      amount += list.length;
    }
    return amount;
  }

  //List<TaskObject> tasks;

  double percentComplete() {
    if (tasks.isEmpty) {
      return 1;
    }
    var completed = 0;
    var amount = 0;
    for (final list in tasks.values) {
      amount += list.length;
      for (final task in list) {
        if (task.isCompleted()) {
          completed++;
        }
      }
    }
    return completed / amount;
  }
}

class TaskObject {
  TaskObject(this.task, this.date) : _completed = false;
  TaskObject.import(this.task, this.date, bool completed)
      : _completed = completed;
  DateTime date;
  String task;
  bool _completed;

  void setComplete(bool value) {
    _completed = value;
  }

  bool isCompleted() => _completed;
}
