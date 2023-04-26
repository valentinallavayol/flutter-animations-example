// ignore_for_file: inference_failure_on_instance_creation

import 'package:flutter/material.dart';
import 'package:panzetapp/app/home/home_screen.dart';

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomeScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return child;
            },
          ),
        );
      },
      child: const SizedBox(
        height: 60,
        width: 60,
        child: Icon(
          Icons.close,
          color: Colors.white,
        ),
      ),
    );
  }
}
