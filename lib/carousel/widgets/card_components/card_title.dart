import 'package:flutter/material.dart';

class CardTitle extends StatelessWidget {
  const CardTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Great title',
      style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
    );
  }
}
