import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    required this.imageUrl,
    this.margin,
    this.padding,
    this.boxfit = BoxFit.cover,
    this.height,
    this.width,
    this.child,
    this.radius,
  });

  final double? height;

  final double? width;

  final String imageUrl;

  final EdgeInsetsGeometry? margin;

  final EdgeInsetsGeometry? padding;

  final BoxFit boxfit;

  final Widget? child;

  final BorderRadius? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      child: DecoratedBox(
        key: ValueKey<String>(imageUrl),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(imageUrl),
            fit: BoxFit.cover,
          ),
          borderRadius: radius,
        ),
        child: child,
      ),
    );
  }
}
