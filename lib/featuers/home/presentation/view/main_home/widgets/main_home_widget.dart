import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy_app/featuers/home/presentation/controller/banner/banner_cubit.dart';
import 'package:mr_candy_app/featuers/home/presentation/controller/banner/banner_states.dart';
import 'package:mr_candy_app/featuers/splash/presentation/views/widgets/image_logo_widget.dart';

import '../../../../../../core/utilies/app_colors.dart';
import '../../../../../login/presentation/views/widgets/gredient_color_for_screen.dart';
import 'bannar_and_smooth_widget.dart';
import 'categories_widget.dart';

class MainHomeWidget extends StatelessWidget {
  const MainHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const GredientColorForScreen(
          color1: AppColors.purple,
          color2: AppColors.blue,
        ),
        Stack(
          children: [
            Column(
              // alignment: Alignment.topCenter,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: ImageLogoWidget(),
                ),
                const SizedBox(height: 100,),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    decoration:  BoxDecoration(
                        color: AppColors.white.withOpacity(0.95)
                    ),
                    child: const CategoriesWidget(),
                  ),
                ),
              ],
            ),
            BlocBuilder<BannerCubit, BannerStates>(
              builder: (context, state) {
                return   BannerAndSmoothWidget();
              },
            ),
          ],
        )
      ],
    );
  }
}
