import 'package:flutter/material.dart';

class CardHeaderTween extends RectTween {
  CardHeaderTween({super.begin, super.end});

  final Cubic _cubic = const Cubic(0, 0, 0.8, 1.13);

  @override
  Rect lerp(double t) {
    final height = end!.top - begin!.top;
    final width = end!.left - begin!.left;

    final transformedY = _cubic.transform(t);

    final animatedX = begin!.left + (t * width);
    final animatedY = begin!.top + (transformedY * height);

    return Rect.fromLTWH(animatedX, animatedY, begin!.width, begin!.height);
  }
}
