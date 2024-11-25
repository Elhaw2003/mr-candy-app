import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy_app/core/utilies/app_colors.dart';
import 'package:mr_candy_app/core/utilies/app_texts.dart';
import 'package:mr_candy_app/featuers/home/presentation/controller/category/category_state.dart';
import 'package:mr_candy_app/featuers/home/presentation/view/main_home/widgets/categories_item.dart';

import '../../../controller/category/category_cubit.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<CategoryCubit, CategoryStates>(
  builder: (context, state) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 120
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20,),
            const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20),
            child: Text(
               AppTexts.categories,
              style: TextStyle(
                color: AppColors.mixPurpleAndBlue,
                fontSize: 15,
                fontWeight: FontWeight.w700
              ),
            ),
          ),
          const SizedBox(height: 5,),
          Wrap(
            children: [
              ...BlocProvider.of<CategoryCubit>(context).categories.map((categoryModel){
                return SizedBox(
                  width: MediaQuery.sizeOf(context).width/3,
                  child: CategoriesItem(categoryModel: categoryModel),
                );
          })
            ],
          )
        ],
      ),
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