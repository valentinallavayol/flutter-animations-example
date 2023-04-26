import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'package:panzetapp/carousel/dummy_data.dart';
import 'package:panzetapp/carousel/widgets/card_components/rounded_image.dart';

class OverlappedImages extends StatelessWidget {
  const OverlappedImages({
    super.key,
    required this.animationController,
    required this.selectedImageUrl,
  });

  final String selectedImageUrl;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    final animations = _buildImagesAnimation();
    final fadeAnimations = _buildImagesFadeAnimation();
    final sideImages = _findSideImages();
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: sideImages
              .mapIndexed(
                (index, image) => Flexible(
                  child: _buildBackgroundDetailImage(
                    animation: animations[index + 1],
                    fadeAnimation: fadeAnimations[index + 1],
                    imageUrl: image,
                  ),
                ),
              )
              .toList(),
        ),
        _buildBackgroundDetailImage(
          isFrontImage: true,
          animation: animations[0],
          fadeAnimation: fadeAnimations[0],
          imageUrl: selectedImageUrl,
        ),
      ],
    );
  }

  List<String> _findSideImages() {
    final selectedImageIndex = data.indexOf(selectedImageUrl);
    final lastImageIndex = data.length - 1;
    if (selectedImageIndex == 0) {
      return [data[lastImageIndex], data[1]];
    }
    if (selectedImageIndex == lastImageIndex) {
      return [data[lastImageIndex - 1], data[0]];
    }

    return [data[selectedImageIndex - 1], data[selectedImageIndex + 1]];
  }

  List<Interval> _buildAnimationIntervals() {
    return List.generate(
      3,
      (index) {
        final offset = 0.075 * index;
        return Interval(
          0.3 + offset,
          0.85 + offset,
          curve: const ElasticOutCurve(0.6),
        );
      },
    );
  }

  List<Animation<AlignmentGeometry>> _buildImagesAnimation() {
    final animationIntervals = _buildAnimationIntervals();

    return animationIntervals
        .map(
          (interval) => Tween<AlignmentGeometry>(
            begin: Alignment.center,
            end: Alignment.topCenter,
          ).animate(
            CurvedAnimation(parent: animationController, curve: interval),
          ),
        )
        .toList();
  }

  List<Animation<double>> _buildImagesFadeAnimation() {
    final animationIntervals = _buildAnimationIntervals();

    return animationIntervals
        .map(
          (interval) => Tween<double>(
            begin: 0,
            end: 1,
          ).animate(
            CurvedAnimation(parent: animationController, curve: interval),
          ),
        )
        .toList();
  }

  Widget _buildBackgroundDetailImage({
    bool isFrontImage = false,
    required String imageUrl,
    required Animation<AlignmentGeometry> animation,
    required Animation<double> fadeAnimation,
  }) {
    final verticalMargin = isFrontImage ? 50.0 : 110.0;
    final horizontalMargin = isFrontImage ? 90.0 : 0.0;
    return FadeTransition(
      opacity: fadeAnimation,
      child: AlignTransition(
        alignment: animation,
        child: RoundedImage(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          margin: EdgeInsets.symmetric(
            vertical: verticalMargin,
            horizontal: horizontalMargin,
          ),
          height: 300,
          imageUrl: imageUrl,
          radius: BorderRadius.circular(16),
          child: Container(),
        ),
      ),
    );
  }
}
