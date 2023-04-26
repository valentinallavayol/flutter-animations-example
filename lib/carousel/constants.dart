import 'package:flutter/animation.dart';

class CarouselConstants {
  static const imageAnimationEnd = 0.07;
  static const textAnimationStart = 0.06;
  static const cardAnimationEnd = 0.07;
  static const backImageAnimationStart = 0.07;
  static const backImageAnimationEnd = 0.24;

  static const cardImageHeightPct = .43;

  //Carousel animation duration
  static const carouselAnimationDuration = Duration(milliseconds: 200);

  //Carousel animation interval
  static const carouselImageInterval =
      Interval(0.01, 0.95, curve: Curves.easeOut);
}
