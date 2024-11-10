import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mr_candy_app/core/utilies/app_svg_image.dart';
import '../../../../../core/utilies/app_colors.dart';
import '../../../../../core/utilies/app_texts.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({super.key, required this.currentIndex, this.onTap});
  final int currentIndex;
  final void Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 73,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(

          backgroundColor:  AppColors.mixPurpleAndBlue,
          currentIndex: currentIndex,
          unselectedItemColor: AppColors.white,
          selectedItemColor: AppColors.white,
          selectedLabelStyle: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
          ),
          unselectedLabelStyle: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400
          ),
          onTap: onTap,
          items:  [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppSvgImage.notActiveSettings
                ),
                label:  AppTexts.settings
            ),
            BottomNavigationBarItem(
                icon:  SvgPicture.asset(
                    AppSvgImage.notActiveBasket
                ),
                label:AppTexts.basket
            ),
            const BottomNavigationBarItem(
                icon:  Icon(Icons.favorite),
                label:AppTexts.favorites
            ),
          ],
        ),
      ),
    );
  }
}
