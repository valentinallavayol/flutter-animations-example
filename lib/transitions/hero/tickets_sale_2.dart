import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:panzetapp/transitions/hero/constants/colors.dart';
import 'package:panzetapp/transitions/hero/constants/paths.dart';

class TicketsSale2 extends StatelessWidget {
  const TicketsSale2({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SafeArea(
        child: Hero(
          tag: 'blackBox',
          createRectTween: _createRectTween,
          child: Container(
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
    );
  }

  static RectTween _createRectTween(Rect? begin, Rect? end) {
    return CircularRectTween(
      begin: begin ?? Rect.zero,
      end: end ?? Rect.zero,
    );
  }
}

class CircularRectTween extends RectTween {
  CircularRectTween({Rect? begin, Rect? end})
      : super(begin: begin ?? Rect.zero, end: end ?? Rect.zero);

  @override
  Rect lerp(double t) {
    final width = lerpDouble(begin?.width, end?.width, t);
    final startWidthCenter = (begin?.left ?? 0) + ((begin?.width ?? 1) / 2);
    final startHeightCenter = (begin?.top ?? 0) + ((begin?.height ?? 1) / 2);

    return Rect.fromCircle(
      center: Offset(startWidthCenter, startHeightCenter),
      radius: (width ?? 1) * 2.3,
    );
  }
}
