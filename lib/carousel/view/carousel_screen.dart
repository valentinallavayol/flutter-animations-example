import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panzetapp/carousel/cubit/carousel_cubit.dart';
import 'package:panzetapp/carousel/dummy_data.dart';
import 'package:panzetapp/carousel/widgets/animated_pages.dart';
import 'package:panzetapp/carousel/widgets/background_components/background_gradient.dart';
import 'package:panzetapp/carousel/widgets/background_components/image_slider.dart';
import 'package:panzetapp/carousel/widgets/card_components/card_button.dart';
import 'package:panzetapp/carousel/widgets/carousel_card_content.dart';

class CarouselExample extends StatefulWidget {
  const CarouselExample({super.key});

  @override
  CarouselExampleState createState() => CarouselExampleState();
}

class CarouselExampleState extends State<CarouselExample> {
  late PageController _cardPageController;

  @override
  void initState() {
    super.initState();

    _cardPageController = PageController(viewportFraction: 0.8)
      ..addListener(() {
        context
            .read<CarouselCubit>()
            .setSelectedPage(_cardPageController.page!);
      });
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = context.watch<CarouselCubit>().state;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Stack(
            children: data.reversed
                .map(
                  (movie) => ImageSlider(
                    pageValue: currentPage,
                    image: movie,
                    index: data.indexOf(movie),
                  ),
                )
                .toList(),
          ),
          const BackgroundGradient(),
          AnimatedPages(
            pageController: _cardPageController,
            pageValue: currentPage,
            childBuiler: (index, __) => CarouselCardContent(
              imageUrl: data[index],
              isActive:
                  index == currentPage.ceil() || index == currentPage.floor(),
            ),
            pageCount: data.length,
          ),
          const CardButton(
            margin: EdgeInsets.symmetric(horizontal: 42, vertical: 24),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _cardPageController.dispose();
    super.dispose();
  }
}
