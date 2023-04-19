import 'package:flutter/material.dart';
import 'package:panzetapp/carousel/colors.dart';
import 'package:panzetapp/carousel/widgets/animations/card_header_curve.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({
    super.key,
    required this.rating,
    required this.size,
    required this.starId,
  });
  final double rating;
  final double size;
  final String starId;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildRatingNumber(),
        const SizedBox(width: 10),
        ..._buildStars()
      ],
    );
  }

  Hero _buildRatingNumber() {
    return Hero(
      tag: 'ratingStarNumber$starId',
      createRectTween: (begin, end) => CardHeaderTween(begin: begin, end: end),
      child: const Material(color: Colors.transparent, child: Text('4.0')),
    );
  }

  List<Widget> _buildStars() {
    return List.generate(5, (index) {
      return Hero(
        tag: 'ratingStar$index$starId',
        createRectTween: (begin, end) {
          return _createRectTween(begin, end, index);
        },
        child: Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: AppColors.kCoolOrange2,
          size: size,
        ),
      );
    });
  }

  static RectTween _createRectTween(Rect? begin, Rect? end, int index) {
    switch (index) {
      case 0:
        return CustomRectTween(
          begin: begin,
          end: end,
          cubic: const Cubic(0, 0, 1, 1.13),
        );
      case 1:
        return CustomRectTween(
          begin: begin,
          end: end,
          cubic: const Cubic(0.1, 0, 1, 1.10),
        );
      case 2:
        return CustomRectTween(
          begin: begin,
          end: end,
          cubic: const Cubic(0.3, 0, 1, 1.05),
        );
      case 3:
        return CustomRectTween(
          begin: begin,
          end: end,
          cubic: const Cubic(0.5, 0, 1, 0.98),
        );
      case 4:
        return CustomRectTween(
          begin: begin,
          end: end,
          cubic: const Cubic(0.7, 0, 1, 0.87),
        );
      default:
        return CustomRectTween(
          begin: begin,
          end: end,
          cubic: const Cubic(0.5, 0, 0.8, 0.53),
        );
    }
  }
}

class CustomRectTween extends RectTween {
  CustomRectTween({
    super.begin,
    super.end,
    required Cubic cubic,
  }) : _cubic = cubic;

  final Cubic _cubic;

  @override
  Rect lerp(double t) {
    final height = end!.top - begin!.top;
    final width = end!.left - begin!.left;

    final transformedY = _cubic.transform(t);

    final animatedX = begin!.left + (t * width);
    final animatedY = begin!.top + (transformedY * height);

    return Rect.fromLTWH(animatedX, animatedY, 1, 1);
  }
}
