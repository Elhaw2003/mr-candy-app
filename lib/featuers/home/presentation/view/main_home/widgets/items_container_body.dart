import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy_app/core/utilies/app_colors.dart';
import 'package:mr_candy_app/core/utilies/app_texts.dart';
import 'package:mr_candy_app/featuers/home/presentation/controller/most_selling/most_selling_cubit.dart';
import 'package:mr_candy_app/featuers/home/presentation/view/main_home/widgets/categories_item.dart';
import 'package:mr_candy_app/featuers/home/presentation/view/main_home/widgets/most_selling_grid_view.dart';

import '../../../controller/category/category_cubit.dart';

class ItemsContainerBody extends StatelessWidget {
  const ItemsContainerBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 85),
      child: CustomScrollView(
        // crossAxisAlignment: CrossAxisAlignment.end,
        // // mainAxisAlignment: MainAxisAlignment.center,
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
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
          ),
          SliverToBoxAdapter(
            child: Wrap(
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
          ),
          const SliverToBoxAdapter(
            child: Padding(
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
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 7,
            ),
          ),
          SliverGrid.builder
            (
            itemCount: 2,
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return MostSellingGridView(
                mostSellingModel: BlocProvider.of<MostSellingCubit>(context).products[index],
              );
            },
          )
        ],
      ),
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
