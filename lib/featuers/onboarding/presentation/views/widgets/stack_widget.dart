import 'package:flutter/material.dart';
import 'package:mr_candy_app/core/utilies/app_texts.dart';

import '../../../../../core/utilies/app_colors.dart';
import '../../../../../core/utilies/app_images.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(AppImages.containerOnboarding),
        Image.asset(
          AppImages.onboarding1,
          width: 272,
          height: 181,
        ),
        const Positioned(
          top: 52,
          left: 33,
          child: Text(
            AppTexts.skip,
            style: TextStyle(
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
