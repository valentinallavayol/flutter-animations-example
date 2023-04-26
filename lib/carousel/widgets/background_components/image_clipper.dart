import 'package:flutter/material.dart';

class ImageClipper extends CustomClipper<Path> {
  ImageClipper({required this.progress});

  final double progress;

  @override
  Path getClip(Size size) {
    final path = Path();
    return path
      ..addRect(
        Rect.fromLTRB(
          size.width - (size.width * progress),
          0,
          size.width,
          size.height,
        ),
      );
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
