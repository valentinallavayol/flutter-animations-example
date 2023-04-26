import 'package:flutter/material.dart';

typedef ChildBuilder = Widget Function(int index, BuildContext context);
typedef OnPageChangeCallback = void Function(int index);

class AnimatedPages extends StatelessWidget {
  const AnimatedPages({
    super.key,
    required this.pageController,
    required this.pageValue,
    required this.childBuiler,
    required this.pageCount,
  });

  final PageController pageController;
  final double pageValue;
  final ChildBuilder childBuiler;
  final int pageCount;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const ClampingScrollPhysics(),
      controller: pageController,
      itemCount: pageCount,
      itemBuilder: (context, index) {
        /// If we are building the page to the right of the actual active page
        if (index == pageValue.floor() + 1 || index == pageValue.floor() + 2) {
          return Transform.translate(
            offset: Offset(0, 100 * (index - pageValue)),
            child: childBuiler(index, context),
          );
        }

        /// If we are building the page to the left of the actual active page
        if (index == pageValue.floor() || index == pageValue.floor() - 1) {
          return Transform.translate(
            offset: Offset(0, 100 * (pageValue - index)),
            child: childBuiler(index, context),
          );
        }

        /// If we are building the active page
        return childBuiler(index, context);
      },
    );
  }
}
