import 'package:flutter/material.dart';
import 'package:panzetapp/parallax/widgets/all_destinations.dart';

class ParallaxExample extends StatelessWidget {
  const ParallaxExample({super.key});
  static const _padding = 24.0;
  static const _spacing = 24.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 76),
          buildHeader(),
          const SizedBox(height: 16),
          const AllDestinations(padding: _padding, spacing: _spacing),
          const SizedBox(height: 36),
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: _padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Discover',
            style: TextStyle(
              color: Color(0xFF29303D),
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Explore the best places in the world!',
            style: TextStyle(
              color: const Color(0xFF29303D).withOpacity(0.6),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
