import 'package:flutter/material.dart';

import '../../../../../../core/utilies/app_colors.dart';
import '../../../../data/models/category_model.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({super.key,required this.categoryModel});
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              categoryModel.image,
              color: AppColors.mixPurpleAndBlue,
              height: 60,
              width: 80,
            ),
            Text(categoryModel.title)
          ],
        ),
      ),
    );
  }
}
