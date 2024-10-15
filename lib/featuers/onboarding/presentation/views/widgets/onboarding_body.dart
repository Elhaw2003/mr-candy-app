import 'package:flutter/material.dart';
import 'package:mr_candy_app/featuers/onboarding/data/lists/onboarding_list.dart';
import 'package:mr_candy_app/featuers/onboarding/presentation/views/widgets/onboarding_item.dart';
class OnboardingBody extends StatelessWidget {
    OnboardingBody({super.key});
    PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return  PageView.builder(
      itemCount: OnboardingList().onBoardings.length,
      controller: pageController,
      itemBuilder: (context, index) {
        // int index = index;
        return OnboardingItem(
            index: index,
            pageController: pageController
        );
      },
    );
  }
}
