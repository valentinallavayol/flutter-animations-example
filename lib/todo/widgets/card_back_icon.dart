import 'package:flutter/material.dart';
import 'package:panzetapp/todo/models/todo_object.dart';

class CardBackIcon extends StatelessWidget {
  const CardBackIcon({super.key, required this.todoObject, this.onPressed});

  final TodoObject todoObject;

  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '${todoObject.uuid}_backIcon',
      child: Material(
        color: Colors.transparent,
        type: MaterialType.transparency,
        child: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.grey,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
