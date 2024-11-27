import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy_app/featuers/home/presentation/controller/category/category_cubit.dart';
import 'package:mr_candy_app/featuers/home/presentation/controller/category/category_state.dart';
import '../../../../../../core/utilies/app_colors.dart';
import '../../../../data/models/category_model.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({super.key, required this.categoryModel});

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
            CachedNetworkImage(
              height: 60,
              width: 55,
              fit: BoxFit.cover,
              imageUrl: categoryModel.image != null && categoryModel.image.isNotEmpty
                  ? categoryModel.image
                  : 'https://via.placeholder.com/200',  // Fallback image URL
              // placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error_outlined),
            ),
            const SizedBox(height: 6,),
            Text(
                categoryModel.title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.brown
              ),
            )
          ],
        ),
      ),
    );
  }
}
