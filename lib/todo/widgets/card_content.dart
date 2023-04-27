import 'package:flutter/material.dart';
import 'package:panzetapp/todo/models/todo_object.dart';
import 'package:panzetapp/todo/widgets/card_back_icon.dart';
import 'package:panzetapp/todo/widgets/card_progress_bar.dart';
import 'package:panzetapp/todo/widgets/card_rounded_icon.dart';
import 'package:panzetapp/todo/widgets/card_tasks_number.dart';
import 'package:panzetapp/todo/widgets/card_title.dart';

class CardContent extends StatelessWidget {
  const CardContent({super.key, required this.todoObject});

  final TodoObject todoObject;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 10,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    CardBackIcon(todoObject: todoObject),
                    CardRoundedIcon(todoObject: todoObject),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
          CardTasksNumber(todoObject: todoObject),
          const Spacer(),
          CardTitle(todoObject: todoObject),
          const Spacer(),
          CardProgressBar(todoObject: todoObject),
        ],
      ),
    );
  }
}
