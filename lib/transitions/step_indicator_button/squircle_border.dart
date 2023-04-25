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

  // List<Point<double>> generateCoordinates(int n, int power, double radius) {
  //   List<Point<double>> coordinates = [];
  //   for (int i = 0; i < n; i++) {
  //     double angle = 2 * pi * i / n;
  //     double x = radius * cos(angle) * pow(cos(angle).abs(), 1 / power - 1);
  //     double y = radius * sin(angle) * pow(sin(angle).abs(), 1 / power - 1);
  //     coordinates.add(Point<double>(x, y));
  //   }

  //   return coordinates;
  // }

  @override
  Path backgroundPath(Rect rect, double superRadius) {
    final c = rect.center;
    final dx = c.dx * (1.0 / superRadius);
    final dy = c.dy * (1.0 / superRadius);

    final cdx = c.dx + marginBorder + (spaceBetweenIndicators / 2);
    final cdy = c.dy + marginBorder + (spaceBetweenIndicators / 2);
    final background = Path()
      ..moveTo(c.dx, 0 - marginBorder - (spaceBetweenIndicators / 2))
      ..relativeCubicTo(cdx - dx, 0, cdx, dy, cdx, cdy)
      ..relativeCubicTo(0, cdy - dy, -dx, cdy, -cdx, cdy)
      ..relativeCubicTo(-(cdx - dx), 0, -cdx, -dy, -cdx, -cdy)
      ..relativeCubicTo(0, -(cdy - dy), dx, -cdy, cdx, -cdy)
      ..close();

    return background;
  }

  @override
  Path getPath(Rect rect, int position, int total) {
    final c = rect.center;
    final dx = c.dx * (1.0 / superRadius);
    final dy = c.dy * (1.0 / superRadius);
    final path1 = Path()
      ..moveTo(
        c.dx + (spaceBetweenIndicators / 2),
        0.0 - (spaceBetweenIndicators / 2),
      )
      ..relativeCubicTo(
        c.dx - dx,
        0,
        c.dx,
        dy,
        c.dx,
        c.dy - (spaceBetweenIndicators / 2),
      );
    final path2 = Path()
      ..moveTo(
        c.dx * 2 + (spaceBetweenIndicators / 2),
        c.dy + (spaceBetweenIndicators / 2),
      )
      ..relativeCubicTo(
        0,
        c.dy - dy,
        -dx,
        c.dy,
        -c.dx + (spaceBetweenIndicators / 2),
        c.dy,
      );
    final path3 = Path()
      ..moveTo(
        c.dx - (spaceBetweenIndicators / 2),
        (c.dy * 2) + (spaceBetweenIndicators / 2),
      )
      ..relativeCubicTo(
        -(c.dx - dx),
        0,
        -c.dx,
        -dy,
        -c.dx,
        -c.dy + (spaceBetweenIndicators / 2),
      );
    final path4 = Path()
      ..moveTo(
        0.0 - (spaceBetweenIndicators / 2),
        c.dy - (spaceBetweenIndicators / 2),
      )
      ..relativeCubicTo(
        0,
        -(c.dy - dy),
        dx,
        -c.dy,
        c.dx - (spaceBetweenIndicators / 2),
        -c.dy,
      );
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
