import 'package:flutter/material.dart';
import 'package:panzetapp/carousel/widgets/animations/card_header_curve.dart';
import 'package:panzetapp/carousel/widgets/card_components/card_chips.dart';
import 'package:panzetapp/carousel/widgets/card_components/card_title.dart';
import 'package:panzetapp/carousel/widgets/card_components/rating_bar.dart';

class CardHeader extends StatelessWidget {
  const CardHeader({super.key, required this.currentPage});

  final String currentPage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Hero(
            tag: 'card-header$currentPage',
            createRectTween: (begin, end) =>
                CardHeaderTween(begin: begin, end: end),
            child: Material(
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [CardTitle(), CardChips()],
              ),
            ),
          ),
          RatingBar(rating: 4, size: 12, starId: currentPage)
        ],
      ),
    );
  }
}
