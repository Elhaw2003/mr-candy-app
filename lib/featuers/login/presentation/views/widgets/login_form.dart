import 'package:flutter/material.dart';
import 'package:mr_candy_app/core/widgets/custom_text_form_field.dart';

import '../../../../../core/utilies/app_colors.dart';
import '../../../../../core/utilies/app_texts.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          )
      ),
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 25),
        children: const [
          SizedBox(height: 60,),
          CustomTextFormField(
            text: AppTexts.insertEmail,
            icon: Icon(Icons.email_outlined,color: AppColors.mixPurpleAndBlue,),
          ),
          SizedBox(height: 24,),
          CustomTextFormField(
            text: AppTexts.insertEmail,
            icon: Icon(Icons.lock_outlined,color: AppColors.mixPurpleAndBlue,),
          ),
        ],
      ),
    );
  }
}
