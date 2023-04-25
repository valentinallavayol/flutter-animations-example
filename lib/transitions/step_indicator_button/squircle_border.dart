import 'package:flutter/material.dart';
import 'package:panzetapp/transitions/step_indicator_button/step_indicator_button_border.dart';

class SquircleBorder extends StepIndicatorButtonBorder {
  const SquircleBorder({
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
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(side.width);

  @override
  ShapeBorder scale(double t) {
    return SquircleBorder(
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
    final dx = c.dx * (1.0 / superRadius);
    final dy = c.dy * (1.0 / superRadius);

    final cdx =
        c.dx + (spaceBetweenIndicators / 2) + (withBorder ? marginBorder : 0);
    final cdy =
        c.dy + (spaceBetweenIndicators / 2) + (withBorder ? marginBorder : 0);

    final background = Path()
      ..moveTo(
        c.dx,
        0 - (spaceBetweenIndicators / 2) - (withBorder ? marginBorder : 0),
      )
      ..relativeCubicTo(cdx - dx, 0, cdx, dy, cdx, cdy)
      ..relativeCubicTo(0, cdy - dy, -dx, cdy, -cdx, cdy)
      ..relativeCubicTo(-(cdx - dx), 0, -cdx, -dy, -cdx, -cdy)
      ..relativeCubicTo(0, -(cdy - dy), dx, -cdy, cdx, -cdy)
      ..close();
    return background;
  }
}
