import 'package:flutter/material.dart';
import 'package:panzetapp/transitions/ripple/constants/colors.dart';
import 'package:panzetapp/transitions/ripple/constants/paths.dart';
import 'package:panzetapp/transitions/ripple/constants/texts.dart';
import 'package:panzetapp/transitions/ripple/summer_onboarding_screen.dart';

const summerScreen1 = SummerOnboardingScreen(
  color: summerPage1Color,
  title: summer1Title,
  description: summer1Description,
  image: summer1Image,
  withRippleButton: true,
  nextScreen: summerScreen2,
  colorNext: summerPage2Color,
  position: 1,
);
const summerScreen2 = SummerOnboardingScreen(
  color: summerPage2Color,
  title: summer2Title,
  description: summer2Description,
  image: summer2Image,
  withRippleButton: true,
  nextScreen: summerScreen3,
  colorNext: summerPage3Color,
  position: 2,
);
const summerScreen3 = SummerOnboardingScreen(
  color: summerPage3Color,
  title: summer3Title,
  description: summer3Description,
  image: summer3Image,
  withRippleButton: false,
  position: 3,
  colorNext: summerPage1Color,
);

class SummerTravelOnboarding extends StatelessWidget {
  const SummerTravelOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: summerScreen1,
    );
  }
}
