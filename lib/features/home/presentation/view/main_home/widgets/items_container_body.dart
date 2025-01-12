import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utilities/app_colors.dart';
import '../../../../../../core/utilities/app_texts.dart';
import '../../../controller/most_selling/most_selling_cubit.dart';
import '../../../controller/most_selling/most_selling_state.dart';
import 'categories_item.dart';
import 'most_selling_grid_view.dart';

class ItemsContainerBody extends StatelessWidget {
  const ItemsContainerBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 150,
        ),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            textAlign: TextAlign.end,
            AppTexts.categories,
            style: TextStyle(
                color: AppColors.mixPurpleAndBlue,
                fontSize: 15.sp,
                fontWeight: FontWeight.w700),
          ),
        ),
        const CategoriesItem(),
         Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child:  Text(
            textAlign: TextAlign.end,
            AppTexts.mostSelling,
            style: TextStyle(
                color: AppColors.mixPurpleAndBlue,
                fontSize: 15.sp,
                fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        BlocBuilder<MostSellingCubit, MostSellingStates>(
          builder: (context, state) {
            return state is LoadingMostSellingState
                ? const Center(child: CircularProgressIndicator())
                : const MostSellingGridView();
          },
        ),
      ],
    );
    ;
  }
}
// List<CategoryModel> list = [
//   CategoryModel(image: AppImages.logoSplash, title: "title"),
//   CategoryModel(image: AppImages.logoSplash, title: "title"),
//   CategoryModel(image: AppImages.logoSplash, title: "title"),
//   CategoryModel(image: AppImages.logoSplash, title: "title"),
//   CategoryModel(image: AppImages.logoSplash, title: "title"),
//   CategoryModel(image: AppImages.logoSplash, title: "title"),
// ];
