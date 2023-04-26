import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:panzetapp/carousel/constants.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
    required this.imageUrl,
    required this.imageAnimation,
    required this.onPressed,
  });

  final String imageUrl;

  final Animation<double> imageAnimation;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed.call,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            height: MediaQuery.of(context).size.height *
                CarouselConstants.cardImageHeightPct,
          ),
          ClipRect(
            clipper: RectangleClipper(imageAnimation.value),
            child: Container(
              height: imageAnimation.value,
              width: imageAnimation.value,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RectangleClipper extends CustomClipper<Rect> {
  RectangleClipper(this.progress);
  final double progress;

  @override
  Rect getClip(Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final width = size.width * progress;
    final height = size.height * progress;

    return Rect.fromCenter(center: center, width: width, height: height);
  }

  @override
  bool shouldReclip(RectangleClipper oldClipper) {
    return oldClipper.progress != progress;
  }
}
