import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:panzetapp/parallax/dummy_data.dart';

class DestinationItem extends StatelessWidget {
  const DestinationItem({
    super.key,
    required this.index,
    required this.details,
    required this.imageWidth,
    required this.imageOffset,
    required this.indexFactor,
  });
  final int index;
  final Destination details;
  final double imageWidth;
  final double imageOffset;
  final double indexFactor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: imageWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Stack(
          fit: StackFit.expand,
          children: [
            buildImage(),
            buildRating(),
            bottomText(),
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    return Image.asset(
      details.image,
      fit: BoxFit.cover,
      alignment: Alignment(-imageOffset + indexFactor * index, 0),
    );
  }

  Widget buildRating() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              height: 48,
              color: const Color(0xFF29303D).withOpacity(0.4),
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star, color: Color(0xFFFFD600), size: 20),
                    const SizedBox(width: 8),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        details.rating,
                        style: const TextStyle(
                          color: Color(0xFFEEF7FF),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomText() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              height: 48,
              color: const Color(0xFF29303D).withOpacity(0.4),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    const Icon(Icons.location_on, color: Color(0xFFEEF7FF)),
                    const SizedBox(width: 4),
                    Text(
                      details.city,
                      style: const TextStyle(
                        color: Color(0xFFEEF7FF),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ', ${details.country}',
                      style: TextStyle(
                        color: const Color(0xFFEEF7FF).withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
