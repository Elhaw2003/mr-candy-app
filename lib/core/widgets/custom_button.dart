import 'package:flutter/material.dart';
import 'package:mr_candy_app/core/utilies/app_colors.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, required this.text});
  final void Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
            text,
          style: const TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18
          ),
        ),
      ),
    );
  }
}
