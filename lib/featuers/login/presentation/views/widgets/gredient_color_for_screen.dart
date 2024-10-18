import 'package:flutter/material.dart';
import 'package:mr_candy_app/core/utilies/app_colors.dart';

class GredientColorForScreen extends StatelessWidget {
  const GredientColorForScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.blue,
              AppColors.purple,
            ],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          )
      ),
    );
  }
}
