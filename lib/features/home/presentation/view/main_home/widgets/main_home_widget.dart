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
    Future.wait([
    context.read<BannerCubit>().getBanner(),
    BlocProvider.of<CategoryCubit>(context).getCategories(),
    BlocProvider.of<MostSellingCubit>(context).getMostSelling(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ListView(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              width: double.infinity,
              height: height*0.209,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.purple,
                      AppColors.blue2,
                    ],
                  )),
            ),
            const ImageLogoWidget(),
            const Positioned(
              bottom: -135,
              child: BannerAndSmoothWidget(),
            )
          ],
        ),
        const ItemsContainerBody(),
      ],
    );
  }
}
