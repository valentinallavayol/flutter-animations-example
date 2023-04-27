import 'package:flutter/material.dart';
import 'package:panzetapp/todo/models/color_choice.dart';
import 'package:panzetapp/todo/models/todo_object.dart';

List<TodoObject> todos = [
  TodoObject.import(
      'randomUuid', 'Custom', 1, ColorChoices.choices[0], Icons.alarm, {
    DateTime(2018, 5, 3): [
      TaskObject('Task 1', DateTime(2018, 5, 3)),
      TaskObject('Task 2', DateTime(2018, 5, 3)),
      TaskObject('Task 3', DateTime(2018, 5, 3)),
      TaskObject('Task 4', DateTime(2018, 5, 3)),
    ],
    DateTime(2019, 5, 4): [
      TaskObject('Task 1', DateTime(2019, 5, 4)),
      TaskObject('Task 2', DateTime(2019, 5, 4)),
      TaskObject('Task 3', DateTime(2019, 5, 4)),
      TaskObject('Task 4', DateTime(2019, 5, 4)),
    ]
  }),
  TodoObject('Personal', Icons.person, ColorChoices.choices[1]),
  TodoObject('Work', Icons.work, ColorChoices.choices[2]),
];
