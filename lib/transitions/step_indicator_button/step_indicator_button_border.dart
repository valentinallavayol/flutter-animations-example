import 'package:flutter/material.dart';

abstract class StepIndicatorButtonBorder extends ShapeBorder {
  const StepIndicatorButtonBorder({
    this.side = BorderSide.none,
    this.superRadius = 5.0,
    required this.marginBorder,
    required this.filledColor,
    required this.emptyColor,
    required this.spaceBetweenIndicators,
    required this.filledUntil,
    required this.totalSteps,
  });

  final BorderSide side;
  final double superRadius;
  final Color filledColor;
  final Color emptyColor;
  final double marginBorder;
  final double spaceBetweenIndicators;
  final int filledUntil;
  final int totalSteps;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(side.width);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return backgroundPath(rect.deflate(side.width), superRadius);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return backgroundPath(rect, superRadius);
  }

  Path backgroundPath(Rect rect, double superRadius, {bool withBorder = true});

  Path _filledPath(Rect rect, double superRadius) {
    var position = 1;
    final completePath = Path();
    while (position <= filledUntil) {
      final path = getPath(rect, position, totalSteps);
      completePath.addPath(path, Offset.zero);
      position++;
    }
    return completePath;
  }

  Path _unfilledPath(Rect rect, double superRadius) {
    var position = filledUntil + 1;
    final completePath = Path();
    while (position <= totalSteps) {
      final path = getPath(rect, position, totalSteps);
      completePath.addPath(path, Offset.zero);
      position++;
    }
    return completePath;
  }

  Path getPath(Rect rect, int position, int total) {
    final path = backgroundPath(rect, superRadius, withBorder: false);
    final pathMetric = path.computeMetrics().first;
    final pathDistance = pathMetric.length;
    final stepDistance = (pathDistance / totalSteps).round();
    var startingPoint =
        stepDistance * (position - 1) + (spaceBetweenIndicators / 2);
    if (position == 0) startingPoint -= 1;
    final endPoint = startingPoint + stepDistance - spaceBetweenIndicators;
    final pointsIncluded = <Offset>[];
    for (var i = startingPoint; i <= endPoint; i++) {
      pointsIncluded.add(pathMetric.getTangentForOffset(i)!.position);
    }
    final pathToReturn = Path()
      ..moveTo(pointsIncluded[0].dx, pointsIncluded[0].dy);
    for (var i = 0; i < pointsIncluded.length; i++) {
      pathToReturn.lineTo(pointsIncluded[i].dx, pointsIncluded[i].dy);
    }
    return pathToReturn;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final paintFilledLines = Paint()
      ..color = filledColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    final pathFilled = _filledPath(rect, superRadius);
    canvas.drawPath(pathFilled, paintFilledLines);

    final paintUnfilledLines = Paint()
      ..color = emptyColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    final pathUnfilled = _unfilledPath(rect, superRadius);
    canvas.drawPath(pathUnfilled, paintUnfilledLines);
  }
}
