import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:panzetapp/transitions/liquid/constants/colors.dart';
import 'package:panzetapp/transitions/liquid/constants/paths.dart';
import 'package:panzetapp/transitions/liquid/constants/texts.dart';
import 'package:panzetapp/transitions/liquid/education_onboarding_screen.dart';

class EducationLearning extends StatelessWidget {
  const EducationLearning({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
            pages: const [
              EducationOnboardingScreen(
                title: onboarding1Title,
                description: onboarding1Description,
                color: onboardingPage1Color,
                image: onboarding1Image,
              ),
              EducationOnboardingScreen(
                title: onboarding2Title,
                description: onboarding2Description,
                color: onboardingPage2Color,
                image: onboarding2Image,
              ),
              EducationOnboardingScreen(
                title: onboarding3Title,
                description: onboarding3Description,
                color: onboardingPage3Color,
                image: onboarding3Image,
              ),
            ],
          ),
          Positioned(
            left: 23,
            top: 53,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}
