import 'package:flutter/material.dart';
import 'package:mr_candy_app/core/utilies/app_colors.dart';
import 'package:mr_candy_app/core/utilies/app_texts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(
            colors: [
              AppColors.blue,
              AppColors.purple,
            ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        )
      ),
      child: Text(
          AppTexts.next,
        style: TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.w700,
          fontSize: 18
        ),
      ),
    );
  }
}
