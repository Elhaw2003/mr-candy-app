import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mr_candy_app/features/home/data/models/most_selling_model.dart';

import '../../../../../../core/utilities/app_colors.dart';

class BestSellingWidget extends StatelessWidget {
  const BestSellingWidget({super.key,  required this.mostSellingModel});
  final MostSellingModel mostSellingModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                alignment: Alignment.center,
                width: 200.w,
                height: 190.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: AppColors.grey.withOpacity(0.10)
                ),
                child: CachedNetworkImage(
                  height: 100.h,
                  width: 100.w,
                  fit: BoxFit.contain,
                  imageUrl: mostSellingModel.image.isNotEmpty
                      ? mostSellingModel.image
                      : 'https://via.placeholder.com/200',  // Fallback image URL
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error_outlined),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 18.r,
                  backgroundColor: AppColors.white,
                  foregroundColor: AppColors.mixPurpleAndBlue,
                  child: const Icon(Icons.favorite_border_outlined),
                ),
              ),
              Positioned(
                left: 10,
                top: 16,
                child: Container(
                  alignment: Alignment.center,
                  height: 25.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                      color: AppColors.mixPurpleAndBlue,
                      borderRadius: BorderRadius.circular(4.r)
                  ),
                  child: Text(
                    "${mostSellingModel.discount} %",
                    style:  TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: AppColors.mixPurpleAndBlue,
                    borderRadius: BorderRadius.circular(4.r)
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
                      // textAlign: TextAlign.end,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      mostSellingModel.name,
                      style: TextStyle(
                          color: AppColors.brown,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp
                      ),
                    ),
                    Text(
                      // textAlign: TextAlign.end,
                      "${mostSellingModel.price}",
                      maxLines:  1,
                      style: TextStyle(
                          color: AppColors.mixPurpleAndBlue,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp
                      ),
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
