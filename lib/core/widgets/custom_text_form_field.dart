import 'package:flutter/material.dart';
import 'package:mr_candy_app/core/utilies/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.icon, required this.text, required this.controller,});
  final Icon icon;
  final String text;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(
        color: AppColors.mixPurpleAndBlue
      ),
      textDirection: TextDirection.rtl,
      onTapOutside: (p){
        return FocusManager.instance.primaryFocus!.unfocus();
      },
      decoration: InputDecoration(
        hintTextDirection: TextDirection.rtl,
        hintText: text,
        hintStyle: const TextStyle(
          color: AppColors.mixPurpleAndBlue,
          fontSize: 11,
          fontWeight: FontWeight.w400
        ),
        suffixIcon:  SizedBox(
          width: 30,
          child: Row(
            children: [
              const SizedBox(
                height: 30,
                  child: VerticalDivider(
                    thickness: 1,
                    color: AppColors.mixPurpleAndBlue,
                  )
              ),
              icon,
            ],
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1,color: AppColors.mixPurpleAndBlue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1,color: AppColors.mixPurpleAndBlue),
        )
      ),
    );
  }
}