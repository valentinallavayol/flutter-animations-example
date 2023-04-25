import 'package:flutter/material.dart';
import 'package:panzetapp/transitions/step_indicator_button/circle_border.dart'
    as circle;
import 'package:panzetapp/transitions/step_indicator_button/squircle_border.dart';

enum StepIndicatorButtonShape { squircle, circle }

class StepIndicatorButton extends StatelessWidget {
  const StepIndicatorButton({
    super.key,
    StepIndicatorButtonShape shape = StepIndicatorButtonShape.squircle,
    double width = 75,
    double height = 75,
    Color backgroundColor = Colors.white,
    Color filledColor = const Color.fromRGBO(214, 189, 201, 1),
    Color emptyColor = const Color.fromRGBO(242, 242, 242, 1),
    double marginBorder = 10,
    double spaceBetweenIndicators = 5,
    Widget? child,
    required int totalSteps,
    required int filledUntilStep,
  })  : _shape = shape,
        _width = width,
        _height = height,
        _backgroundColor = backgroundColor,
        _filledColor = filledColor,
        _emptyColor = emptyColor,
        _marginBorder = marginBorder,
        _spaceBetweenIndicators = spaceBetweenIndicators,
        _child = child,
        _totalSteps = totalSteps,
        _filledUntilStep = filledUntilStep;

  final StepIndicatorButtonShape _shape;
  final double _width;
  final double _height;
  final Color _backgroundColor;
  final Color _filledColor;
  final Color _emptyColor;
  final double _marginBorder;
  final double _spaceBetweenIndicators;
  final Widget? _child;
  final int _totalSteps;
  final int _filledUntilStep;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
      height: _height,
      child: Material(
        color: _backgroundColor,
        shape: _shape == StepIndicatorButtonShape.circle
            ? circle.CircleBorder(
                filledColor: _filledColor,
                emptyColor: _emptyColor,
                marginBorder: _marginBorder,
                spaceBetweenIndicators: _spaceBetweenIndicators,
                filledUntil: _filledUntilStep,
                totalSteps: _totalSteps,
              )
            : SquircleBorder(
                filledColor: _filledColor,
                emptyColor: _emptyColor,
                marginBorder: _marginBorder,
                spaceBetweenIndicators: _spaceBetweenIndicators,
                filledUntil: _filledUntilStep,
                totalSteps: _totalSteps,
              ),
        child: _child,
      ),
    );
  }
}
