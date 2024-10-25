import 'package:flutter/material.dart';
import 'package:mr_candy_app/core/utilies/app_colors.dart';
import 'package:mr_candy_app/core/utilies/app_texts.dart';

class AvatarImage extends StatelessWidget {
  const AvatarImage({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                color: AppColors.lightWhite,
                border: Border.all(color:AppColors.mixPurpleAndBlue,),
                borderRadius: BorderRadius.circular(100)
            ),
            child:  const Icon(
              Icons.add_a_photo,
              color: AppColors.mixPurpleAndBlue,
              size: 40,
            )
          ),
          const SizedBox(height: 9,),
           const Text(
              AppTexts.addImageProfile,
            style: TextStyle(
              color: AppColors.mixPurpleAndBlue,
              fontSize: 11,
              fontWeight: FontWeight.w400
            ),
          )
        ],
      ),
    );
  }
}
