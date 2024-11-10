import 'package:flutter/material.dart';
import 'package:mr_candy_app/core/utilies/app_colors.dart';
import 'package:mr_candy_app/core/utilies/app_images.dart';
import 'package:mr_candy_app/core/utilies/app_texts.dart';
import 'package:mr_candy_app/featuers/home/data/models/category_model.dart';
import 'package:mr_candy_app/featuers/home/presentation/view/main_home/widgets/categories_item.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            AppTexts.categories,
            style: TextStyle(
              color: AppColors.mixPurpleAndBlue,
              fontSize: 15,
              fontWeight: FontWeight.w700
            ),
          ),
        ),
        Wrap(
          children: [
            ...list.map((categoryModel){
              return SizedBox(
                width: MediaQuery.sizeOf(context).width/3,
                child: CategoriesItem(categoryModel: categoryModel),
              );
        })
          ],
        )
      ],
    );
  }
}
List<CategoryModel> list = [
  CategoryModel(image: AppImages.logoSplash, title: "title"),
  CategoryModel(image: AppImages.logoSplash, title: "title"),
  CategoryModel(image: AppImages.logoSplash, title: "title"),
  CategoryModel(image: AppImages.logoSplash, title: "title"),
  CategoryModel(image: AppImages.logoSplash, title: "title"),
  CategoryModel(image: AppImages.logoSplash, title: "title"),
];