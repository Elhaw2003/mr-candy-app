import 'package:flutter/material.dart';
import 'package:mr_candy_app/core/utilies/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../data/lists/onboarding_list.dart';


class SmoothWidget extends StatelessWidget {
  const SmoothWidget({super.key, required this.pageController});
  final PageController pageController ;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count:  OnboardingList().onBoardings.length,
      textDirection: TextDirection.rtl,
      effect:  JumpingDotEffect (
          spacing:  5.0,
          radius:  6.0,
          dotWidth:  6,
          dotHeight:  6,
          dotColor:  AppColors.blue.withOpacity(0.2),
          activeDotColor:  AppColors.purple,
      ),
    )    ;
  }
}
