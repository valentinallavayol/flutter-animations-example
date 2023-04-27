import 'package:flutter/material.dart';
import 'package:panzetapp/todo/models/todo_object.dart';

class CardTitle extends StatelessWidget {
  const CardTitle({super.key, required this.todoObject});

  final TodoObject todoObject;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '${todoObject.uuid}_title',
      child: Material(
        color: Colors.transparent,
        child: Text(
          todoObject.title,
          style: const TextStyle(fontSize: 30),
          softWrap: false,
        ),
      ),
    );
  }
}
