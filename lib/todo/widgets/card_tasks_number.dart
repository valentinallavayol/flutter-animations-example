import 'package:flutter/material.dart';
import 'package:panzetapp/todo/models/todo_object.dart';

class CardTasksNumber extends StatelessWidget {
  const CardTasksNumber({super.key, required this.todoObject});

  final TodoObject todoObject;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '${todoObject.uuid}_number_of_tasks',
      child: Material(
        color: Colors.transparent,
        child: Text(
          '${todoObject.taskAmount()} Tasks',
          style: const TextStyle(),
          softWrap: false,
        ),
      ),
    );
  }
}
