import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utilities/app_colors.dart';
import '../../../../../../core/utilities/app_texts.dart';
import '../../../controller/category/category_cubit.dart';
import '../../../controller/category/category_state.dart';
import '../../../controller/most_selling/most_selling_cubit.dart';
import '../../../controller/most_selling/most_selling_state.dart';
import 'categories_item.dart';
import 'most_selling_grid_view.dart';

class ItemsContainerBody extends StatelessWidget {
  const ItemsContainerBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryStates>(
      builder: (context, state) {
        return state is LoadingCategoryState
            ? const Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      textAlign: TextAlign.end,
                      AppTexts.categories,
                      style: TextStyle(
                          color: AppColors.mixPurpleAndBlue,
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Wrap(
                    children: [
                      ...BlocProvider.of<CategoryCubit>(context)
                          .categories
                          .map((categoryModel) {
                        return SizedBox(
                          width: MediaQuery.sizeOf(context).width / 3,
                          child: CategoriesItem(categoryModel: categoryModel),
                        );
                      })
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      textAlign: TextAlign.end,
                      AppTexts.mostSelling,
                      style: TextStyle(
                          color: AppColors.mixPurpleAndBlue,
                          fontSize: 15,
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
      },
    );
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
