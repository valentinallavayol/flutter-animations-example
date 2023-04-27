import 'package:flutter/material.dart';
import 'package:panzetapp/todo/models/todo_object.dart';

class CardBackground extends StatelessWidget {
  const CardBackground({
    super.key,
    required this.todoObject,
  });

  final TodoObject todoObject;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '${todoObject.uuid}_background',
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
