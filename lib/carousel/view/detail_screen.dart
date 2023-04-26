import 'package:flutter/material.dart';
import 'package:panzetapp/carousel/widgets/background_components/background_gradient.dart';
import 'package:panzetapp/carousel/widgets/background_components/background_overlapped_images.dart';
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
      duration: const Duration(milliseconds: 1500),
    )..forward();

    _cardAnimation = Tween<double>(
      begin: 0.75,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.3, curve: Curves.easeOut),
      ),
    )..addListener(() {
        setState(() {});
      });

    _buttonAnimation = Tween<double>(begin: 42, end: 16).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.15, 0.27, curve: Curves.easeOut),
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
          const BackgroundGradient(),
          CardContainer(
            heightFactor: 0.79,
            widthFactor: _cardAnimation.value,
            margin: const EdgeInsets.only(top: 50),
            padding: const EdgeInsets.all(24),
            child: DetailContent(
              imageUrl: widget.imageUrl,
              animationController: _animationController,
            ),
          ),
          CardButton(
            margin: EdgeInsets.symmetric(
              horizontal: _buttonAnimation.value,
              vertical: 24,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(top: 32),
            child: IconButton(
              splashRadius: 16,
              splashColor: Colors.black12,
              onPressed: () async {
                await _animationController
                    .animateBack(
                      0,
                      duration: const Duration(milliseconds: 1500),
                    )
                    // .reverse()
                    .whenComplete(() => Navigator.pop(context));
              },
              icon: const Icon(Icons.close, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
