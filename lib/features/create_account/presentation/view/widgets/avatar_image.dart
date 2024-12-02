import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy_app/features/create_account/presentation/view/widgets/show_bottom_sheet.dart';
import '../../../../../core/utilities/app_colors.dart';
import '../../../../../core/utilities/app_texts.dart';
import '../../controller/image/select_image_cubit.dart';
import '../../controller/image/select_image_states.dart';

class AvatarImage extends StatelessWidget {
  const AvatarImage({super.key});

  @override
  Widget build(BuildContext context) {
    var imageCubit = BlocProvider.of<ImageCubit>(context);
    return BlocBuilder<ImageCubit, ImageStates>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            showModalBottomSheet(
                backgroundColor: AppColors.white,
                context: context, builder: (c) {
              return ShowBottomSheet(imageCubit: imageCubit,);
            });
          },
          child: Center(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        backgroundColor: AppColors.white,
                        context: context, builder: (c) {
                      return ShowBottomSheet(imageCubit: imageCubit,);
                    });
                  },
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                        color: AppColors.lightWhite,
                        borderRadius: BorderRadius.circular(80),
                        border: Border.all(
                            color: imageCubit.image == null ? AppColors
                                .mixPurpleAndBlue : AppColors.white,
                            width: 1
                        )
                    ),
                    child: imageCubit.image == null
                        ? const Icon(
                      Icons.add_a_photo,
                      size: 50,
                      color: AppColors.mixPurpleAndBlue,
                    )
                        : ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Image.file(
                          File(imageCubit.image!.path),
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  imageCubit.image == null ? AppTexts.addImageProfile : AppTexts
                      .imageAdded,
                  style: const TextStyle(
                      color: AppColors.mixPurpleAndBlue,
                      fontWeight: FontWeight.w400,
                      fontSize: 14
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
