import 'package:flutter/material.dart';
import 'package:panzetapp/todo/models/todo_object.dart';

class CardProgressBar extends StatelessWidget {
  const CardProgressBar({super.key, required this.todoObject});

  final TodoObject todoObject;

  @override
  Widget build(BuildContext context) {
    final percentComplete = todoObject.percentComplete();
    return Hero(
      tag: '${todoObject.uuid}_progress_bar',
      child: Material(
        color: Colors.transparent,
        child: Row(
          children: <Widget>[
            Expanded(
              child: LinearProgressIndicator(
                value: percentComplete,
                backgroundColor: Colors.grey.withAlpha(50),
                valueColor: AlwaysStoppedAnimation<Color>(
                  todoObject.color,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                '${(percentComplete * 100).round()}%',
              ),
            )
          ],
        ),
      ),
    );
  }
}
