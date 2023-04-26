import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:panzetapp/carousel/widgets/background_components/image_clipper.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({
    super.key,
    required this.index,
    required this.image,
    required this.pageValue,
  });
  final int index;
  final String image;
  final double pageValue;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ImageClipper(progress: getProgress()),
      child: CachedNetworkImage(
        imageUrl: image,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  double getProgress() {
    if (index == pageValue.floor()) {
      return 1.0 - (pageValue - index);
    } else if (index < pageValue.floor()) {
      return 0;
    } else {
      return 1;
    }
  }
}
