import 'dart:math';

import 'package:flutter/material.dart';
import 'package:panzetapp/transitions/step_indicator_button/step_indicator_button_border.dart';

class CircleBorder extends StepIndicatorButtonBorder {
  const CircleBorder({
    super.side,
    super.superRadius,
    required super.marginBorder,
    required super.filledColor,
    required super.emptyColor,
    required super.spaceBetweenIndicators,
    required super.filledUntil,
    required super.totalSteps,
  });

  @override
  ShapeBorder scale(double t) {
    return CircleBorder(
      side: side.scale(t),
      superRadius: superRadius * t,
      filledColor: filledColor,
      emptyColor: emptyColor,
      marginBorder: marginBorder,
      spaceBetweenIndicators: spaceBetweenIndicators,
      filledUntil: filledUntil,
      totalSteps: totalSteps,
    );
  }

  @override
  Path backgroundPath(Rect rect, double superRadius) {
    final c = rect.center;
    final cdx = c.dx + marginBorder + (spaceBetweenIndicators / 2);
    final background = Path()
      ..moveTo(c.dx, 0 - marginBorder - (spaceBetweenIndicators / 2))
      ..addOval(
        Rect.fromCircle(
          center: Offset(c.dx, c.dy),
          radius: cdx,
        ),
      );

    return background;
  }

  @override
  Path getPath(Rect rect, int position, int total) {
    final differencePointA = spaceBetweenIndicators / 3;
    final differencePointB = differencePointA * 2;
    final path1 = Path()
      ..addArc(
        rect,
        (3 * pi) / 2 + differencePointA,
        pi / 2 - differencePointB,
      );
    final path2 = Path()
      ..addArc(rect, 0 + differencePointA, pi / 2 - differencePointB);
    final path3 = Path()
      ..addArc(rect, pi / 2 + differencePointA, pi / 2 - differencePointB);
    final path4 = Path()
      ..addArc(rect, pi + differencePointA, pi / 2 - differencePointB);
    switch (position) {
      case 1:
        return path1;
      case 2:
        return path2;
      case 3:
        return path3;
      case 4:
        return path4;
      default:
        return path1;
    }
  }
}
