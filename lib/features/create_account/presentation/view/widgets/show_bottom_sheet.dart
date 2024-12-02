import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/utilities/app_colors.dart';
import '../../../../../core/utilities/app_texts.dart';
import '../../controller/image/select_image_cubit.dart';

class ShowBottomSheet extends StatelessWidget {
  const ShowBottomSheet({super.key, required this.imageCubit});
  final ImageCubit imageCubit;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => imageCubit.getPhoto(ImageSource.camera, context),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20,),
                Icon(
                  Icons.add_a_photo,
                  color: AppColors.mixPurpleAndBlue,
                  size: 30,
                ),
                SizedBox(height: 15,),
                Text(
                  AppTexts.camera,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: AppColors.mixPurpleAndBlue
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => imageCubit.getPhoto(ImageSource.gallery,context),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20,),
                Icon(
                  Icons.photo,
                  color: AppColors.mixPurpleAndBlue,
                  size: 30,
                ),
                SizedBox(height: 15,),
                Text(
                  AppTexts.gallery,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: AppColors.mixPurpleAndBlue
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
