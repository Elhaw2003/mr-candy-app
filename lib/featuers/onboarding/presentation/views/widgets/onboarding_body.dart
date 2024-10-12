import 'package:flutter/material.dart';
import 'package:mr_candy_app/core/utilies/app_texts.dart';
import 'package:mr_candy_app/core/widgets/custom_button.dart';
import 'package:mr_candy_app/featuers/onboarding/presentation/views/widgets/smooth_widget.dart';
import 'package:mr_candy_app/featuers/onboarding/presentation/views/widgets/stack_widget.dart';

import '../../../../../core/utilies/app_colors.dart';

class OnboardingBody extends StatelessWidget {
    OnboardingBody({super.key});
    PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return  PageView.builder(
      controller: pageController,
      itemBuilder: (context, index) {
        return Column(
          children: [
            const StackWidget(),
            const SizedBox(height: 70,),
            const Text(
              AppTexts.titleInOnboarding1,
              style: TextStyle(
                  color: AppColors.purple,
                  fontSize: 18,
                  fontWeight: FontWeight.w700
              ),
            ),
            const SizedBox(height: 23,),
            Text(
              AppTexts.descInOnboarding1,
              style: TextStyle(
                  color: AppColors.grey.withOpacity(0.7),
                  fontSize: 12,
                  fontWeight: FontWeight.w400
              ),
            ),
            const SizedBox(height: 30,),
            SmoothWidget(pageController: pageController),
            const SizedBox(height: 15,),
            CustomButton()
          ],
        );
      },
    );
  }
}
