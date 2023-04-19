import 'package:flutter/material.dart';

class CardContainer extends StatefulWidget {
  const CardContainer({
    super.key,
    this.padding,
    this.margin,
    required this.child,
    this.heightFactor,
    this.widthFactor,
  });

  final double? heightFactor;
  final double? widthFactor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget child;

  @override
  State<CardContainer> createState() => _CardContainerState();
}

class _CardContainerState extends State<CardContainer> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FractionallySizedBox(
        widthFactor: widget.widthFactor,
        heightFactor: widget.heightFactor,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeOutQuint,
          padding: widget.padding,
          margin: widget.margin,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
