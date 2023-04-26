import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:panzetapp/carousel/dummy_data.dart';
import 'package:panzetapp/carousel/widgets/animations/fade_slide_transition.dart';
import 'package:panzetapp/carousel/widgets/card_components/rounded_image.dart';

class CardActors extends StatelessWidget {
  const CardActors({super.key, required this.animationController});

  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildActorsTitle(),
        const SizedBox(height: 10),
        _buildActorsList()
      ],
    );
  }

  FadeSlideTransition _buildActorsTitle() {
    return FadeSlideTransition(
      interval: const Interval(0.18, 0.21, curve: Curves.easeInOut),
      animationController: animationController,
      child: const Text('Actors', style: TextStyle(fontSize: 16)),
    );
  }

  Row _buildActorsList() {
    final actorsWidgets = actors.mapIndexed((index, actor) {
      final offset = 0.1 * index;
      const interval = Interval(0.20, 0.30, curve: Curves.easeInOut);
      final newInterval = Interval(
        interval.begin + offset,
        interval.end + offset,
        curve: interval.curve,
      );
      return _buildActorWidget(
        actorImage: actor,
        actorName: actorsName[index],
        animationInterval: newInterval,
      );
    }).toList();

    return Row(children: actorsWidgets);
  }

  Widget _buildActorWidget({
    required String actorName,
    required String actorImage,
    required Interval animationInterval,
  }) {
    return Expanded(
      child: FadeSlideTransition(
        animationController: animationController,
        interval: animationInterval,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: RoundedImage(
                  imageUrl: actorImage,
                  radius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 6),
              Text(actorName, style: const TextStyle(fontSize: 12))
            ],
          ),
        ),
      ),
    );
  }
}
