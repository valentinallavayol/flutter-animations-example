import 'package:flutter/material.dart';
import 'package:panzetapp/todo/models/todo_object.dart';
import 'package:panzetapp/todo/widgets/card_back_icon.dart';
import 'package:panzetapp/todo/widgets/card_background.dart';
import 'package:panzetapp/todo/widgets/card_progress_bar.dart';
import 'package:panzetapp/todo/widgets/card_rounded_icon.dart';
import 'package:panzetapp/todo/widgets/card_tasks_number.dart';
import 'package:panzetapp/todo/widgets/card_title.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({required this.todoObject, super.key});

  final TodoObject todoObject;

  @override
  DetailPageState createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  late double percentComplete;
  late AnimationController animationBar;
  late double barPercent = 0;
  late Tween<double> animT;
  late AnimationController scaleAnimation;

  @override
  void initState() {
    scaleAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    percentComplete = widget.todoObject.percentComplete();
    barPercent = percentComplete;
    animationBar = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    )..addListener(() {
        setState(() {
          barPercent = animT.transform(animationBar.value);
        });
      });
    animT = Tween<double>(begin: percentComplete, end: percentComplete);
    scaleAnimation.forward();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    animationBar.dispose();
    scaleAnimation.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CardBackground(todoObject: widget.todoObject),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: CardBackIcon(
              todoObject: widget.todoObject,
              onPressed: Navigator.of(context).pop,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CardRoundedIcon(todoObject: widget.todoObject),
                const SizedBox(height: 30),
                CardTasksNumber(todoObject: widget.todoObject),
                const SizedBox(height: 12),
                CardTitle(todoObject: widget.todoObject),
                const SizedBox(height: 20),
                CardProgressBar(todoObject: widget.todoObject),
                const SizedBox(height: 30),
              ],
            ),
          ),
        )
      ],
    );
  }
}
