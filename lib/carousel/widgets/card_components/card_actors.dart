import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:panzetapp/carousel/dummy_data.dart';
import 'package:panzetapp/carousel/widgets/animations/fade_slide_transition.dart';
import 'package:transparent_image/transparent_image.dart';

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
        child: const Text('Actors', style: TextStyle(fontSize: 16)));
  }

  Row _buildActorsList() {
    final actorsWidgets = actors.mapIndexed((index, actor) {
      final offset = 0.02 * index;
      const interval = Interval(0.20, 0.25, curve: Curves.easeInOut);
      final newInterval = Interval(
        interval.begin + offset,
        interval.end + offset,
        curve: interval.curve,
      );
      return [
        _buildActorWidget(
          actorImage: actor,
          actorName: actorsName[index],
          animationInterval: newInterval,
        ),
        const SizedBox(width: 12)
      ];
    }).reduce((value, element) => [...value, ...element]);

    return Row(
      children: actorsWidgets,
    );
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
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: FadeInImage.memoryNetwork(
                      fadeInDuration: const Duration(milliseconds: 200),
                      placeholder: kTransparentImage,
                      image: actorImage,
                    ).image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(actorName, style: const TextStyle(fontSize: 12))
          ],
        ),
      ),
    );
  }
}
