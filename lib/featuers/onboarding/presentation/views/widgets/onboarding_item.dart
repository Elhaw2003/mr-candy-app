import 'package:flutter/material.dart';
import 'package:mr_candy_app/featuers/login/presentation/views/login_screen.dart';
import 'package:mr_candy_app/featuers/onboarding/presentation/views/widgets/smooth_widget.dart';
import 'package:mr_candy_app/featuers/onboarding/presentation/views/widgets/shape_item_widget.dart';

import '../../../../../core/utilies/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../data/lists/onboarding_list.dart';

class OnboardingItem extends StatelessWidget {
   OnboardingItem({super.key, required this.pageController, required this.index});
 final PageController pageController;
  int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         ShapeItemWidget(index: index,),
        const SizedBox(height: 70,),
         Text(
          OnboardingList().onBoardings[index].title,
          style: const TextStyle(
              color: AppColors.purple,
              fontSize: 18,
              fontWeight: FontWeight.w700
          ),
        ),
        const SizedBox(height: 23,),
        Text(
          OnboardingList().onBoardings[index].desc,
          style: TextStyle(
              color: AppColors.grey.withOpacity(0.7),
              fontSize: 12,
              fontWeight: FontWeight.w400
          ),
        ),
        const SizedBox(height: 30,),
        SmoothWidget(pageController: pageController),
        const SizedBox(height: 15,),
        CustomButton(
          text: OnboardingList().onBoardings[index].textButton,
          onTap: (){
            if(index < OnboardingList().onBoardings.length-1){
              pageController.animateToPage(
                  index+1,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeIn
              );
            }else{
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (c){
                return const LoginScreen();
              }));
            }
            }
        )
      ],
    );
  }
}