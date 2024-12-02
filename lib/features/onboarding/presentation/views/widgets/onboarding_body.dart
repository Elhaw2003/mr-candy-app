import 'package:flutter/material.dart';

import '../../../data/lists/onboarding_list.dart';
import 'onboarding_item.dart';
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
