import 'package:flutter/material.dart';

class FadeSlideTransition extends StatefulWidget {
  const FadeSlideTransition({
    super.key,
    required this.child,
    required this.animationController,
    this.interval,
  });

  final Widget child;
  final AnimationController animationController;
  final Interval? interval;

  @override
  FadeSlideTransitionState createState() => FadeSlideTransitionState();
}

class FadeSlideTransitionState extends State<FadeSlideTransition> {
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: widget.interval != null
            ? Interval(
                widget.interval!.begin,
                widget.interval!.end + 0.1,
                curve: Curves.easeInOutSine,
              )
            : Curves.easeOut,
      ),
    );
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: widget.interval != null
            ? Interval(
                widget.interval!.begin,
                widget.interval!.end,
                curve: Curves.easeOut,
              )
            : Curves.easeOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: widget.child,
      ),
    );
  }
}
