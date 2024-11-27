import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy_app/featuers/home/data/models/most_selling_model.dart';
import 'package:mr_candy_app/featuers/home/presentation/controller/most_selling/most_selling_cubit.dart';
import 'package:mr_candy_app/featuers/home/presentation/controller/most_selling/most_selling_state.dart';

import '../../../../../../core/utilies/app_colors.dart';
class MostSellingGridView extends StatelessWidget {
  const MostSellingGridView({super.key, required this.mostSellingModel, });
  final MostSellingModel mostSellingModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                alignment: Alignment.center,
                width: 180,
                height: 150,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.grey.withOpacity(0.10)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: CachedNetworkImage(
                    height: 60,
                    width: 55,
                    fit: BoxFit.cover,
                    imageUrl: mostSellingModel.image != null && mostSellingModel.image.isNotEmpty
                        ? mostSellingModel.image
                        : 'https://via.placeholder.com/200',  // Fallback image URL
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error_outlined),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.white,
                  foregroundColor: AppColors.mixPurpleAndBlue,
                  child: Icon(Icons.favorite_border_outlined),
                ),
              ),
              Positioned(
                left: 10,
                top: 16,
                child: Container(
                  alignment: Alignment.center,
                  height: 25,
                  width: 40,
                  decoration: BoxDecoration(
                    color: AppColors.mixPurpleAndBlue,
                    borderRadius: BorderRadius.circular(4)
                  ),
                  child: Text(
                      "${mostSellingModel.discount} %",
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: AppColors.mixPurpleAndBlue,
                    borderRadius: BorderRadius.circular(4)
                ),
                child: const Icon(
                  color: AppColors.white,
                    Icons.add
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      textAlign: TextAlign.end,
                      mostSellingModel.name,
                      maxLines: 1,

                    ),
                    Text(
                      textAlign: TextAlign.end,
                      "${mostSellingModel.price}",
                      maxLines:  1,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
