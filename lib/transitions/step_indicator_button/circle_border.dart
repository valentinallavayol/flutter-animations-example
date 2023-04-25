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
  Path backgroundPath(
    Rect rect,
    double superRadius, {
    bool withBorder = true,
  }) {
    final c = rect.center;
    final cdx =
        c.dx + (spaceBetweenIndicators / 2) + (withBorder ? marginBorder : 0);
    final background = Path()
      ..moveTo(
        c.dx,
        0 - (spaceBetweenIndicators / 2) - (withBorder ? marginBorder : 0),
      )
      ..addArc(
        Rect.fromCircle(
          center: Offset(c.dx, c.dy),
          radius: cdx,
        ),
        3 * pi / 2,
        2 * pi,
      );
    return background;
  }
}
