import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panzetapp/carousel/constants.dart';
import 'package:panzetapp/carousel/cubit/carousel_cubit.dart';
import 'package:panzetapp/carousel/view/detail_screen.dart';
import 'package:panzetapp/carousel/widgets/card_components/card_container.dart';
import 'package:panzetapp/carousel/widgets/card_components/card_header.dart';
import 'package:panzetapp/carousel/widgets/card_components/card_image.dart';

class CarouselCardContent extends StatefulWidget {
  const CarouselCardContent({
    super.key,
    required this.imageUrl,
    required this.isActive,
  });

  final String imageUrl;

  final bool isActive;

  @override
  State<CarouselCardContent> createState() => _CarouselCardContentState();
}

class _CarouselCardContentState extends State<CarouselCardContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _imageAnimation;

  @override
  void initState() {
    super.initState();
    final deviceHeight = window.physicalSize.height / window.devicePixelRatio;

    _animationController = AnimationController(
      vsync: this,
      duration: CarouselConstants.carouselAnimationDuration,
    );

    _imageAnimation = Tween<double>(
      begin: deviceHeight * CarouselConstants.cardImageHeightPct,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: CarouselConstants.carouselImageInterval,
      ),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final opacity = widget.isActive ? 1.0 : 0.5;
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
      opacity: opacity,
      child: CardContainer(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 100),
        widthFactor: 0.95,
        child: _buildContent(widget.imageUrl),
      ),
    );
  }

  Widget _buildContent(String imageUrl) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: ImageCard(
            imageUrl: imageUrl,
            imageAnimation: _imageAnimation,
            onPressed: _onImagePress,
          ),
        ),
        CardHeader(currentPage: imageUrl)
      ],
    );
  }

  Future<void> _onImagePress() {
    return _animationController.forward().whenComplete(() async {
      await Navigator.push(
        context,
        PageRouteBuilder<void>(
          pageBuilder: (_, __, ___) {
            return BlocProvider<CarouselCubit>.value(
              value: context.read<CarouselCubit>(),
              child: DetailScreen(imageUrl: widget.imageUrl),
            );
          },
          transitionDuration: const Duration(milliseconds: 700),
          reverseTransitionDuration: const Duration(milliseconds: 700),
          fullscreenDialog: true,
        ),
      );

      await _animationController.reverse();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
