// ignore_for_file: prefer_int_literals

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:panzetapp/transitions/hero/constants/colors.dart';
import 'package:panzetapp/transitions/hero/tickets_sale_2.dart';

class BuyButton extends StatefulWidget {
  const BuyButton({super.key});

  @override
  State<BuyButton> createState() => _BuyButtonState();
}

class _BuyButtonState extends State<BuyButton> with TickerProviderStateMixin {
  String _buttonText = 'BUY TICKETS';

  late AnimationController _controller;
  late Animation<double> _roundnessAnimation;
  late Animation<double> _widthAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 100,
      ),
    )..addListener(() {
        setState(() {});
      });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(seconds: 1),
            pageBuilder: (_, __, ___) => TicketsSale2(),
            fullscreenDialog: true,
          ),
        );
      }
    });

    _roundnessAnimation = Tween(begin: 10.0, end: 25.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );

    _widthAnimation = Tween(begin: 250.0, end: 40.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _buttonText = '';
          _controller.forward();
        });
      },
      child: Hero(
        tag: 'blackBox',
        flightShuttleBuilder: (
          BuildContext flightContext,
          Animation<double> animation,
          HeroFlightDirection flightDirection,
          BuildContext fromHeroContext,
          BuildContext toHeroContext,
        ) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          );
        },
        child: Container(
          width: _widthAnimation.value,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(_roundnessAnimation.value),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            _buttonText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'LexendDeca',
              color: redColor,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              letterSpacing: 0.8,
            ),
          ),
        ),
      ),
    );
  }
}
