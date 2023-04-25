import 'dart:ui';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:panzetapp/carousel/widgets/animations/fade_slide_transition.dart';
import 'package:panzetapp/transitions/hero/constants/colors.dart';
import 'package:panzetapp/transitions/hero/constants/paths.dart';

class TicketsSale2 extends StatefulWidget {
  const TicketsSale2({super.key});

  @override
  State<TicketsSale2> createState() => _TicketsSale2State();

  static RectTween _createRectTween(Rect? begin, Rect? end) {
    return CircularRectTween(
      begin: begin ?? Rect.zero,
      end: end ?? Rect.zero,
    );
  }
}

class _TicketsSale2State extends State<TicketsSale2>
    with SingleTickerProviderStateMixin {
  late Interval _interval;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..forward();
    _interval = const Interval(0.1, 0.3, curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      animationDuration: Duration.zero,
      color: Colors.transparent,
      child: SafeArea(
        child: FadeSlideTransition(
          interval: _interval,
          animationController: _animationController,
          child: Hero(
            tag: 'blackBox',
            createRectTween: TicketsSale2._createRectTween,
            child: Material(
              child: ColoredBox(
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(height: 20),
                    Text(
                      'KINOTEKA',
                      style: TextStyle(
                        fontFamily: 'LexendDeca',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        letterSpacing: 0.8,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 20),
                    Image(
                      image: AssetImage(ticketImage),
                      height: 540,
                    ),
                    SizedBox(height: 20),
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'THANKS FOR THE PURCHASE!',
                      style: TextStyle(
                        fontFamily: 'LexendDeca',
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        letterSpacing: 0.8,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CircularRectTween extends RectTween {
  CircularRectTween({Rect? begin, Rect? end})
      : super(begin: begin ?? Rect.zero, end: end ?? Rect.zero);

  @override
  Rect lerp(double t) {
    final width = lerpDouble(begin?.width, end?.width, t) ?? 0;
    final startWidthCenter = (begin?.left ?? 1) + ((begin?.width ?? 1) / 2);
    final startHeightCenter = (begin?.top ?? 1) + ((begin?.height ?? 1) / 2);

    return Rect.fromCircle(
      center: Offset(startWidthCenter, startHeightCenter),
      radius: width * 2.3,
    );
  }
}
