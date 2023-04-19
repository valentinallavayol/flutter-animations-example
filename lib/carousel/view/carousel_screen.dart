import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panzetapp/carousel/cubit/carousel_cubit.dart';
import 'package:panzetapp/carousel/dummy_data.dart';
import 'package:panzetapp/carousel/widgets/background_image_switcher.dart';
import 'package:panzetapp/carousel/widgets/card_components/card_button.dart';
import 'package:panzetapp/carousel/widgets/carousel_card_content.dart';

class AwesomeCarousel extends StatefulWidget {
  const AwesomeCarousel({super.key});

  @override
  AwesomeCarouselState createState() => AwesomeCarouselState();
}

class AwesomeCarouselState extends State<AwesomeCarousel> {
  final backgroundPageView = PageController();
  late PageController cardPageView;

  @override
  void initState() {
    super.initState();

    cardPageView = PageController(viewportFraction: 0.8)
      ..addListener(_onScroll);
  }

  void _onScroll() {
    final scrollValue = cardPageView.page ?? 0;
    backgroundPageView.jumpTo(scrollValue * MediaQuery.of(context).size.width);
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = context.watch<CarouselCubit>().state.selectedPage;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          BackgroundImageSwitcher(
            imageUrl: data[currentPage],
            controller: backgroundPageView,
          ),
          FractionallySizedBox(
            heightFactor: 0.75,
            child: PageView.builder(
              controller: cardPageView..addListener(_onScroll),
              itemCount: data.length,
              onPageChanged: context.read<CarouselCubit>().setSelectedPage,
              itemBuilder: (BuildContext context, int index) {
                final active = index == currentPage;
                return CarouselCardContent(
                    imageUrl: data[index], isActive: active);
              },
            ),
          ),
          CardButton(
            margin: const EdgeInsets.symmetric(horizontal: 42, vertical: 24),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
