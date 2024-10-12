import 'package:flutter/material.dart';
import 'package:mr_candy_app/core/utilies/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothWidget extends StatelessWidget {
  const SmoothWidget({super.key, required this.pageController});
  final PageController pageController ;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count:  3,
      textDirection: TextDirection.rtl,
      effect:  ScaleEffect(
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
