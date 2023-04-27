import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panzetapp/app/home/category.dart';
import 'package:panzetapp/app/home/category_title.dart';
import 'package:panzetapp/app/home/home_card.dart';
import 'package:panzetapp/carousel/cubit/carousel_cubit.dart';
import 'package:panzetapp/carousel/view/carousel_screen.dart';
import 'package:panzetapp/parallax/parallax_example.dart';
import 'package:panzetapp/todo/view/todo_example.dart';
import 'package:panzetapp/transitions/hero/tickets_sale_1.dart';
import 'package:panzetapp/transitions/liquid/education_learning.dart';
import 'package:panzetapp/transitions/ripple/summer_travel.dart';

final data = <Category>[
  Category(
    'Transitions',
    <CategoryItem>[
      CategoryItem(
        'Summer Onboarding',
        'Ripple Transition',
        const SummerTravelOnboarding(),
      ),
      CategoryItem(
        'Education Onboarding',
        'Liquid Transition',
        const EducationLearning(),
      ),
      CategoryItem(
        'Cinema Tickets Sale',
        'Hero Transition',
        const TicketsSale1(),
      ),
      CategoryItem(
        'To-Do List',
        'Card Hero Transition',
        const TodoExample(),
      ),
      CategoryItem(
        'Cinema Carousel',
        'Epic Transitions',
        BlocProvider(
          create: (context) => CarouselCubit(),
          child: const CarouselExample(),
        ),
      ),
    ],
  ),
  Category(
    'Animations',
    <CategoryItem>[
      CategoryItem(
        'Explore places',
        'Parallax',
        const ParallaxExample(),
      ),
    ],
  ),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(214, 189, 201, 1),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(top: 20),
          children: [
            for (final category in data) ...[
              CategoryTitle(title: category.title),
              for (final item in category.items)
                HomeCard(
                  title: item.title,
                  subtitle: item.subtitle,
                  screen: item.screen,
                )
            ]
          ],
        ),
      ),
    );
  }
}
