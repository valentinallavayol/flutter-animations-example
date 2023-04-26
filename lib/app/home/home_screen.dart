import 'package:flutter/material.dart';
import 'package:panzetapp/app/home/category.dart';
import 'package:panzetapp/app/home/category_title.dart';
import 'package:panzetapp/app/home/home_card.dart';
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
