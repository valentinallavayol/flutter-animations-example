import 'package:flutter/material.dart';
import 'package:panzetapp/todo/models/todo_object.dart';

class CardRoundedIcon extends StatelessWidget {
  const CardRoundedIcon({super.key, required this.todoObject});

  final TodoObject todoObject;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '${todoObject.uuid}_icon',
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey.withAlpha(70),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(
            todoObject.icon,
            color: todoObject.color,
          ),
        ),
      ),
    );
  }
}
