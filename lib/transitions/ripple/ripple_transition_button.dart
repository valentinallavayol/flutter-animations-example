import 'package:flutter/material.dart';
import 'package:rect_getter/rect_getter.dart';

class RippleTransitionButton extends StatefulWidget {
  const RippleTransitionButton({
    super.key,
    required Color backgroundColorNextScreen,
    required Widget nextScreen,
  })  : _backgroundColorNextScreen = backgroundColorNextScreen,
        _nextScreen = nextScreen;

  final Color _backgroundColorNextScreen;
  final Widget _nextScreen;

  @override
  State<RippleTransitionButton> createState() => _RippleTransitionButtonState();
}

class _RippleTransitionButtonState extends State<RippleTransitionButton> {
  final rectGetterKey = RectGetter.createGlobalKey();
  final Duration animationDuration = const Duration(milliseconds: 300);
  final Duration transitionDelay = const Duration(milliseconds: 150);

  Rect? rect;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _ripple(context),
        Positioned(
          bottom: 50,
          right: 50,
          child: RectGetter(
            key: rectGetterKey,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () => _onTap(context),
              child: const Icon(
                Icons.keyboard_double_arrow_right,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _ripple(BuildContext context) {
    if (rect == null) {
      return Container();
    }
    return AnimatedPositioned(
      duration: animationDuration,
      left: rect!.left,
      right: MediaQuery.of(context).size.width - rect!.right,
      top: rect!.top,
      bottom: MediaQuery.of(context).size.height - rect!.bottom,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget._backgroundColorNextScreen,
        ),
      ),
    );
  }

  void _onTap(BuildContext context) {
    setState(
      () => rect = RectGetter.getRectFromKey(
        rectGetterKey,
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(
        () => rect = rect?.inflate(
          1.3 * MediaQuery.of(context).size.longestSide,
        ),
      );
      Future.delayed(transitionDelay, _goToNextPage);
    });
  }

  void _goToNextPage() {
    Navigator.of(context)
        .pushReplacement(
          FadeRouteBuilder<Widget>(
            page: widget._nextScreen,
          ),
        )
        .then((_) => setState(() => rect = null));
  }
}

class FadeRouteBuilder<T> extends PageRouteBuilder<T> {
  FadeRouteBuilder({required this.page})
      : super(
          pageBuilder: (context, animation1, animation2) => page,
          transitionsBuilder: (context, animation1, animation2, child) {
            return FadeTransition(opacity: animation1, child: child);
          },
        );

  final Widget page;
}
