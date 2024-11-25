import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy_app/featuers/home/presentation/controller/banner/banner_cubit.dart';
import 'package:mr_candy_app/featuers/home/presentation/controller/banner/banner_states.dart';
import 'package:mr_candy_app/featuers/home/presentation/controller/category/category_cubit.dart';
import 'package:mr_candy_app/featuers/home/presentation/controller/category/category_state.dart';
import 'package:mr_candy_app/featuers/splash/presentation/views/widgets/image_logo_widget.dart';

import '../../../../../../core/utilies/app_colors.dart';
import '../../../../../login/presentation/views/widgets/gredient_color_for_screen.dart';
import '../../../controller/most_selling/most_selling_cubit.dart';
import 'bannar_and_smooth_widget.dart';
import 'items_container_body.dart';

class MainHomeWidget extends StatefulWidget {
  const MainHomeWidget({super.key});

  @override
  State<MainHomeWidget> createState() => _MainHomeWidgetState();
}

class _MainHomeWidgetState extends State<MainHomeWidget> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<BannerCubit>(context).getBanner();
    BlocProvider.of<CategoryCubit>(context).getCategories();
    BlocProvider.of<MostSellingCubit>(context).getMostSelling();
  }
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
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.white.withOpacity(0.95)
                    ),
                    child: const ItemsContainerBody(),
                  ),
                ),
              ],
            ),
            BannerAndSmoothWidget(),
          ],
        )
      ],
    );
  }
}
