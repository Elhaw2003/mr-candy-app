import 'package:flutter/material.dart';
import 'package:mr_candy_app/core/utilies/app_texts.dart';
import 'package:mr_candy_app/featuers/onboarding/data/lists/onboarding_list.dart';

import '../../../../../core/utilies/app_colors.dart';
import '../../../../../core/utilies/app_images.dart';

class ShapeItemWidget extends StatelessWidget {
  const ShapeItemWidget({super.key,  required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(AppImages.shapeOnboarding),
        Image.asset(
          OnboardingList().onBoardings[index].image,
          width: OnboardingList().onBoardings[index].widthImage,
          height: OnboardingList().onBoardings[index].heightImage,
        ),
         Positioned(
          top: 52,
          left: 33,
          child: Text(
            index < OnboardingList().onBoardings.length-1 ?AppTexts.skip:"",
            style: const TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        )
      ],
    );
  }
}
