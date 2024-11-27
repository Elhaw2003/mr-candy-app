import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy_app/featuers/home/presentation/controller/banner/banner_cubit.dart';
import 'package:mr_candy_app/featuers/home/presentation/controller/banner/banner_states.dart';
import 'package:mr_candy_app/featuers/home/presentation/controller/category/category_state.dart';
import 'package:mr_candy_app/featuers/splash/presentation/views/widgets/image_logo_widget.dart';
import 'package:redacted/redacted.dart';
import '../../../../../../core/utilies/app_colors.dart';
import '../../../../../../core/utilies/app_images.dart';
import '../../../../../login/presentation/views/widgets/gredient_color_for_screen.dart';
import '../../../controller/category/category_cubit.dart';
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
    BlocProvider.of<BannerCubit>(context).getBanner();
    BlocProvider.of<CategoryCubit>(context).getCategories();
    BlocProvider.of<MostSellingCubit>(context).getMostSelling();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              AppColors.blue,
              AppColors.purple,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: const Column(
            children: [
              SizedBox(
                height: 200,
                child: Center(
                  child: ImageLogoWidget(),
                ),
              ),
              Expanded(child: ItemsContainerBody()),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 26, right: 26, top: 150),
          child: BlocBuilder<BannerCubit, BannerStates>(
            builder: (context, state) {
              return  BannerAndSmoothWidget();
            },
          ),
        )
      ],
    );
  }
}
