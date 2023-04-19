import 'package:flutter/material.dart';
import 'package:panzetapp/carousel/dummy_data.dart';

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
    final sideImages = _findSideImages();
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: _buildBackgroundDetailImage(
                animation: animations[1],
                imageUrl: sideImages[0],
              ),
            ),
            Flexible(
              child: _buildBackgroundDetailImage(
                animation: animations[2],
                imageUrl: sideImages[1],
              ),
            ),
          ],
        ),
        Flexible(
          child: _buildBackgroundDetailImage(
            isFrontImage: true,
            animation: animations[0],
            imageUrl: selectedImageUrl,
          ),
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

  List<Animation<AlignmentGeometry>> _buildImagesAnimation() {
    final animationIntervals = List.generate(
      3,
      (index) {
        final offset = 0.04 * index;
        return Interval(
          0.10 + offset,
          0.40 + offset,
          curve: const ElasticOutCurve(0.6),
        );
      },
    );

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

  Widget _buildBackgroundDetailImage({
    bool isFrontImage = false,
    required String imageUrl,
    required Animation<AlignmentGeometry> animation,
  }) {
    final verticalMargin = isFrontImage ? 80.0 : 140.0;
    final horizontalMargin = isFrontImage ? 90.0 : 0.0;
    return AlignTransition(
      alignment: animation,
      child: FractionallySizedBox(
        widthFactor: 0.95,
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: verticalMargin,
            horizontal: horizontalMargin,
          ),
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: !isFrontImage
              ? ColoredBox(
                  color: Colors.black.withOpacity(0.3),
                  child: Container(),
                )
              : null,
        ),
      ),
    );
  }
}
