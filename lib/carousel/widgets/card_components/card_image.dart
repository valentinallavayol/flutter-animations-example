import 'package:flutter/material.dart';

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
    // timeDilation = 6.0;
    return GestureDetector(
      onTap: onPressed.call,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // TODO(valentinaLlavayol) : Try to make this animation better
          Container(
            margin: const EdgeInsets.all(16),
            height: 350,
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
                  image: NetworkImage(imageUrl),
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
