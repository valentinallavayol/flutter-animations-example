import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:panzetapp/transitions/ripple/constants/colors.dart';
import 'package:panzetapp/transitions/ripple/ripple_transition_button.dart';
import 'package:panzetapp/transitions/ripple/summer_travel.dart';

class SummerOnboardingScreen extends StatelessWidget {
  const SummerOnboardingScreen({
    super.key,
    required Color color,
    Color? colorNext,
    required String title,
    required String description,
    required String image,
    required bool withRippleButton,
    required int position,
    Widget? nextScreen,
  })  : _color = color,
        _title = title,
        _description = description,
        _image = image,
        _colorNext = colorNext,
        _withRippleButton = withRippleButton,
        _nextScreen = nextScreen,
        _position = position;

  final Color _color;
  final Color? _colorNext;
  final String _title;
  final String _description;
  final String _image;
  final bool _withRippleButton;
  final Widget? _nextScreen;
  final int _position;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: DelayedDisplay(
                  fadingDuration: const Duration(milliseconds: 400),
                  slidingBeginOffset: const Offset(0, -0.25),
                  child: Center(
                    child: Image(
                      image: AssetImage(_image),
                      height: 400,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 38, right: 38, top: 40),
                child: DelayedDisplay(
                  slidingBeginOffset: const Offset(0, 0.25),
                  fadingDuration: const Duration(milliseconds: 400),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _title,
                        style: const TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        _description,
                        style: const TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          RippleTransitionButton(
            backgroundColor: _color,
            position: _position,
            backgroundColorNextScreen: _colorNext ?? _color,
            nextScreen: _nextScreen ?? summerScreen1,
          ),
          const Positioned(
            left: 23,
            top: 53,
            child: CloseButton(),
          ),
        ],
      ),
    );
  }
}
