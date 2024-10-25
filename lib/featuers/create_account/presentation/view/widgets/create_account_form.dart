import 'package:flutter/material.dart';
import 'package:mr_candy_app/core/widgets/custom_button.dart';
import 'package:mr_candy_app/featuers/create_account/presentation/view/widgets/avatar_image.dart';

import '../../../../../core/utilies/app_colors.dart';
import '../../../../../core/utilies/app_texts.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class CreateAccountForm extends StatelessWidget {
  const CreateAccountForm({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          )
      ),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        children: [
          const SizedBox(height: 40,),
          AvatarImage(),
          const SizedBox(height: 32,),
          CustomTextFormField(
            controller: nameController,
            text: AppTexts.insertName,
            icon: const Icon(
              Icons.person, color: AppColors.mixPurpleAndBlue,),
          ),
          const SizedBox(height: 24,),
          CustomTextFormField(
            controller: emailController,
            text: AppTexts.insertEmail,
            icon: const Icon(
              Icons.email_outlined, color: AppColors.mixPurpleAndBlue,),
          ),
          const SizedBox(height: 24,),
          CustomTextFormField(
            controller: phoneController,
            text: AppTexts.insertPhone,
            icon: const Icon(
              Icons.phone_in_talk_rounded, color: AppColors.mixPurpleAndBlue,),
          ),
          const SizedBox(height: 24,),
          CustomTextFormField(
            controller: passwordController,
            text: AppTexts.insertPassword,
            icon: const Icon(
              Icons.lock_outlined, color: AppColors.mixPurpleAndBlue,),
          ),
          const SizedBox(height: 46,),
          const Center(
            child:  CustomButton(
                text: AppTexts.createAnAccount
            ),
          ),
          const SizedBox(height: 24,),
          const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppTexts.login,
                    style: TextStyle(
                        color: AppColors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 12
                    ),
                  ),
                  Text(
                    AppTexts.haveYouAccount,
                    style: TextStyle(
                        color: AppColors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 12
                    ),
                  ),
                ],
              ),
              Divider(
                color: AppColors.grey,
                height: 0,
                indent:90,
                endIndent: 174,
              )
            ],
          ),
        ],
      ),
    );
  }
}
