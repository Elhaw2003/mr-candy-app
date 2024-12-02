import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utilities/app_colors.dart';
import '../../../../../splash/presentation/views/widgets/image_logo_widget.dart';
import '../../../controller/banner/banner_cubit.dart';
import '../../../controller/banner/banner_states.dart';
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
              AppColors.purple,
              AppColors.blue,
            ],
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
          padding: const EdgeInsets.only( top: 160),
          child: BlocBuilder<BannerCubit, BannerStates>(
            builder: (context, state) {
              return  const BannerAndSmoothWidget();
            },
          ),
        )
      ],
    );
  }
}
