import 'package:flutter/material.dart';

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({super.key, required String title}) : _title = title;

  final String _title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 15),
      child: Text(
        _title.toUpperCase(),
        style: const TextStyle(
          fontFamily: 'LexendDeca',
          fontWeight: FontWeight.w400,
          fontSize: 18,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}
