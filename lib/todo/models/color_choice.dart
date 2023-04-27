import 'package:flutter/material.dart';

class ColorChoice {
  ColorChoice({required this.primary, required this.gradient});

  final Color primary;
  final List<Color> gradient;
}

class ColorChoices {
  static List<ColorChoice> choices = [
    ColorChoice(
      primary: const Color(0xFF5A89E6),
      gradient: [
        const Color.fromRGBO(77, 85, 225, 1),
        const Color.fromRGBO(93, 167, 231, 1),
      ],
    ),
    ColorChoice(
      primary: const Color(0xFFF77B67),
      gradient: [
        const Color.fromARGB(255, 241, 113, 145),
        const Color.fromARGB(255, 255, 184, 118),
      ],
    ),
    ColorChoice(
      primary: const Color(0xFF4EC5AC),
      gradient: [
        const Color.fromARGB(255, 108, 219, 191),
        const Color.fromARGB(255, 61, 212, 184),
      ],
    ),
  ];
}
