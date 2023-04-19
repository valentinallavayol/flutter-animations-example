import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:panzetapp/carousel/widgets/background_overlapped_images.dart';
import 'package:panzetapp/carousel/widgets/card_components/card_button.dart';
import 'package:panzetapp/carousel/widgets/card_components/card_container.dart';
import 'package:panzetapp/carousel/widgets/detail_content.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _cardAnimation;
  late Animation<double> _buttonAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      // duration: const Duration(seconds: 4),
      duration: const Duration(seconds: 4),
    )..forward();

    _cardAnimation = Tween<double>(
      begin: 0.8,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.10, curve: Curves.easeOut),
        // curve: const Interval(0, 0.07, curve: Curves.easeOut),
      ),
    )..addListener(() {
        setState(() {});
      });

    _buttonAnimation = Tween<double>(
      begin: 42,
      end: 16,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.02, 0.10, curve: Curves.easeOut),
        // curve: const Interval(0.02, 0.10, curve: Curves.easeOut),
        // curve: const Interval(0.06, 0.13, curve: Curves.easeOut),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          OverlappedImages(
            animationController: _animationController,
            selectedImageUrl: widget.imageUrl,
          ),
          CardContainer(
            heightFactor: 0.75,
            widthFactor: _cardAnimation.value,
            margin: const EdgeInsets.only(top: 25),
            padding: const EdgeInsets.all(24),
            child: DetailContent(
              imageUrl: widget.imageUrl,
              animationController: _animationController,
            ),
          ),
          CardButton(
            margin: EdgeInsets.symmetric(
                horizontal: _buttonAnimation.value, vertical: 24),
            onPressed: () {
              _animationController.reverse();
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
