import 'package:flutter/material.dart';
import 'package:panzetapp/transitions/hero/tickets_sale_1.dart';
import 'package:panzetapp/transitions/liquid/education_learning.dart';
import 'package:panzetapp/transitions/ripple/summer_travel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transition animations')),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 3,
        separatorBuilder: (context, index) =>
            Divider(height: 1, color: Colors.grey),
        itemBuilder: (_, index) {
          if (index == 0) {
            return ListTile(
              title: const Text('Ripple'),
              trailing: const Icon(Icons.navigate_next),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SummerTravelOnboarding(),
                ),
              ),
            );
          }
          if (index == 1) {
            return ListTile(
              title: const Text('Liquid'),
              trailing: const Icon(Icons.navigate_next),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const EducationLearning(),
                ),
              ),
            );
          }
          if (index == 2) {
            return ListTile(
              title: const Text('Hero'),
              trailing: const Icon(Icons.navigate_next),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const TicketsSale1(),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
