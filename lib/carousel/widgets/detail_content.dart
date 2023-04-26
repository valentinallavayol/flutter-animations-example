import 'package:flutter/material.dart';
import 'package:panzetapp/carousel/dummy_data.dart';
import 'package:panzetapp/carousel/widgets/animations/fade_slide_transition.dart';
import 'package:panzetapp/carousel/widgets/card_components/card_actors.dart';
import 'package:panzetapp/carousel/widgets/card_components/card_header.dart';

class DetailContent extends StatefulWidget {
  const DetailContent({
    super.key,
    required this.imageUrl,
    required this.animationController,
  });

  final String imageUrl;
  final AnimationController animationController;
  @override
  State<DetailContent> createState() => _DetailContentState();
}

class _DetailContentState extends State<DetailContent>
    with SingleTickerProviderStateMixin {
  late Interval _directorTitleInterval;
  late Interval _introductionInterval;

  @override
  void initState() {
    super.initState();
    _directorTitleInterval = const Interval(0.12, 0.30, curve: Curves.easeOut);
    _introductionInterval = const Interval(0.30, 0.50, curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CardHeader(currentPage: widget.imageUrl),
          _spacer,
          _buildDirector(),
          _spacer,
          _buildActors(),
          _spacer,
          _buildIntroduction()
        ],
      ),
    );
  }

  SizedBox get _spacer => const SizedBox(height: 10);

  Widget _buildDirector() {
    return FadeSlideTransition(
      interval: _directorTitleInterval,
      animationController: widget.animationController,
      child: const Text(
        'Director/Todd Phillips',
        style: TextStyle(color: Colors.black87, fontSize: 12),
      ),
    );
  }

  Widget _buildActors() {
    return CardActors(animationController: widget.animationController);
  }

  Widget _buildIntroduction() {
    return FadeSlideTransition(
      interval: _introductionInterval,
      animationController: widget.animationController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          const Text('Introduction', style: TextStyle(fontSize: 16)),
          const SizedBox(height: 15),
          Text(
            movieIntroduction,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 12,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
