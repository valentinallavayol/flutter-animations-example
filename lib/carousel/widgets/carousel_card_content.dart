import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panzetapp/carousel/cubit/carousel_cubit.dart';
import 'package:panzetapp/carousel/view/detail_screen.dart';
import 'package:panzetapp/carousel/widgets/card_components/card_container.dart';
import 'package:panzetapp/carousel/widgets/card_components/card_header.dart';
import 'package:panzetapp/carousel/widgets/card_components/card_image.dart';

class CarouselCardContent extends StatefulWidget {
  const CarouselCardContent(
      {super.key, required this.imageUrl, required this.isActive});

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

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _imageAnimation = Tween<double>(
      begin: 350,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.01, 0.95, curve: Curves.easeOut),
        // curve: const Interval(0, 0.07, curve: Curves.easeOut),
      ),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final top = widget.isActive ? 25.0 : 120.0;
    final opacity = widget.isActive ? 1.0 : 0.5;
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOutQuint,
      opacity: opacity,
      child: CardContainer(
          padding: const EdgeInsets.all(12),
          margin: EdgeInsets.only(top: top, bottom: 24),
          widthFactor: 0.95,
          child: _buildContent(widget.imageUrl)),
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
    return _animationController.forward().whenComplete(() {
      Navigator.push(
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
    });
  }
}
