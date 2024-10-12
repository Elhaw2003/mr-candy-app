import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mr_candy_app/core/utilies/app_colors.dart';
import 'package:mr_candy_app/featuers/splash/presentation/views/widgets/image_logo_widget.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  AppColors.blue,
                  AppColors.purple,
                ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
          ),
        ),
        BounceInLeft(
            duration: const Duration(seconds: 3),
            child: const ImageLogoWidget()
        )
      ],
    );
  }
}
