import '../../../../core/utilies/app_images.dart';
import '../../../../core/utilies/app_texts.dart';
import '../models/onboarding_model.dart';

class OnboardingList{
  List<OnboardingModel> onBoardings = [
    OnboardingModel(
        image: AppImages.onboarding1,
        title: AppTexts.titleInOnboarding1,
        desc: AppTexts.descInOnboarding1,
        textButton: AppTexts.next,
        widthImage: 272,
        heightImage: 181
    ),
    OnboardingModel(
        image: AppImages.onboarding2,
        title: AppTexts.titleInOnboarding2,
        desc: AppTexts.descInOnboarding2,
        textButton: AppTexts.next,
        widthImage: 244,
        heightImage: 244
    ),
    OnboardingModel(
        image: AppImages.onboarding3,
        title: AppTexts.titleInOnboarding3,
        desc: AppTexts.descInOnboarding3,
        textButton: AppTexts.start,
        widthImage: 246,
        heightImage: 221
    ),
  ];
}