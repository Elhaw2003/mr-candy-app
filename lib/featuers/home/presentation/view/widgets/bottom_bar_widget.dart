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
    return SizedBox(
      height: 75,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor:  AppColors. blue2,
          currentIndex: currentIndex,
          unselectedItemColor: AppColors.white.withOpacity(0.75),
          selectedItemColor: AppColors.white,
          onTap: onTap,
          items:  [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                 currentIndex == 0 ? AppSvgImage.homeActiveIcon:AppSvgImage.homeNonActiveIcon
                ),
                label:  AppTexts.home
            ),
            BottomNavigationBarItem(
                icon:  SvgPicture.asset(
                     AppSvgImage.favoriteNonActiveIcon
                ),
                label:AppTexts.favorites
            ),
             BottomNavigationBarItem(
               icon:  SvgPicture.asset(
                   currentIndex == 2 ? AppSvgImage.cartActiveIcon:AppSvgImage.cartNonActiveIcon
                ),
                label:AppTexts.cart
            ),
             BottomNavigationBarItem(
               icon:  SvgPicture.asset(
                   AppSvgImage.settingNonActiveIcon
                ),
                label:AppTexts.settings
            ),
          ],
        ),
      ),
    );
  }
}
