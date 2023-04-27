import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:panzetapp/todo/dummy_data.dart';
import 'package:panzetapp/todo/models/todo_object.dart';
import 'package:panzetapp/todo/view/details.dart';
import 'package:panzetapp/todo/widgets/card_background.dart';
import 'package:panzetapp/todo/widgets/card_content.dart';

class TodoExample extends StatefulWidget {
  const TodoExample({super.key});

  @override
  TodoExampleState createState() => TodoExampleState();
}

class TodoExampleState extends State<TodoExample>
    with TickerProviderStateMixin {
  late ScrollController scrollController;
  late Gradient? backgroundGradient;
  late ColorTween colorTween;
  late int currentPage = 0;
  late Color constBackColor;

  @override
  void initState() {
    super.initState();
    colorTween = ColorTween(begin: todos[0].color, end: todos[0].color);
    backgroundGradient = todos[0].gradient;
    scrollController = ScrollController();
    scrollController.addListener(() {
      final position = scrollController.position;
      final scrollExtentPerPage =
          position.maxScrollExtent / (todos.length.toDouble() - 1);

      final pageNumber = position.pixels ~/ scrollExtentPerPage;

      final scrolledPercentage = position.pixels / scrollExtentPerPage;
      final percent = scrolledPercentage - pageNumber;
      if (todos.length - 1 < pageNumber + 1) {
        return;
      }
      colorTween
        ..begin = todos[pageNumber].color
        ..end = todos[pageNumber + 1].color;
      setState(() {
        backgroundGradient = todos[pageNumber]
            .gradient
            .lerpTo(todos[pageNumber + 1].gradient, percent);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(gradient: backgroundGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: const CloseButton(color: Colors.white),
          elevation: 0,
          title: const Text('TODO'),
          centerTitle: true,
        ),
        body: _buildContent(),
      ),
    );
  }

  Column _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Spacer(),
        _buildHelloText(),
        const Spacer(),
        _buildTasksAmountText(),
        const Spacer(),
        _buildTodayText(),
        const Spacer(),
        _buildTaskCardsList(),
        const Spacer(flex: 2),
      ],
    );
  }

  Expanded _buildTaskCardsList() {
    final width = MediaQuery.of(context).size.width;
    return Expanded(
      flex: 20,
      child: ListView.builder(
        controller: scrollController,
        padding: const EdgeInsets.only(left: 40, right: 40),
        scrollDirection: Axis.horizontal,
        itemExtent: width - 80,
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todoObject = todos[index];
          return Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                _onTaskCardPressed(context, todoObject);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(70),
                      offset: const Offset(3, 3),
                      blurRadius: 8,
                    )
                  ],
                ),
                height: 250,
                child: Stack(
                  children: <Widget>[
                    CardBackground(todoObject: todoObject),
                    CardContent(
                      todoObject: todoObject,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _onTaskCardPressed(BuildContext context, TodoObject todoObject) {
    Navigator.of(context).push(
      PageRouteBuilder<void>(
        pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) =>
            DetailPage(todoObject: todoObject),
        transitionDuration: const Duration(milliseconds: 750),
      ),
    );
  }

  Padding _buildTasksAmountText() {
    return const Padding(
      padding: EdgeInsets.only(left: 50),
      child: Text(
        'You have 10 tasks to do today.',
        style: TextStyle(color: Colors.white70),
      ),
    );
  }

  Padding _buildHelloText() {
    return const Padding(
      padding: EdgeInsets.only(left: 50),
      child: Text(
        'Hello, John!',
        style: TextStyle(color: Colors.white, fontSize: 30),
      ),
    );
  }

  Padding _buildTodayText() {
    return Padding(
      padding: const EdgeInsets.only(left: 50),
      child: RichText(
        text: TextSpan(
          children: [
            const TextSpan(
              text: 'TODAY : ',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: DateFormat.yMMMMd().format(DateTime.now()),
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
