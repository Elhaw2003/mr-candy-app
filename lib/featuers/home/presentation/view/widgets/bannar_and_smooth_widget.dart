import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy_app/featuers/home/presentation/controller/banner/banner_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/utilies/app_colors.dart';

class BannerAndSmoothWidget extends StatelessWidget {
  const BannerAndSmoothWidget({super.key});
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    var bannerCubit = BlocProvider.of<BannerCubit>(context).banners;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 190),
      child: Column(
        children: [
          SizedBox(
            height: 170,
            child: ListView.separated(
              separatorBuilder:  (context, index) => const SizedBox(width: 20,),
              controller: controller,
              scrollDirection: Axis.horizontal,
              itemCount: bannerCubit.length,
              // separatorBuilder: (context, index) => const SizedBox(width: 20,),
                itemBuilder: (context, index) {
                  return  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        width: 330,
                        fit: BoxFit.cover,
                        imageUrl: bannerCubit[index].image != null && bannerCubit[index].image.isNotEmpty
                            ? bannerCubit[index].image
                            : 'https://via.placeholder.com/200',  // Fallback image URL
                        placeholder: (context, url) => Container(
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.grey
                          ),
                        ),
                        errorWidget: (context, url, error) => const Icon(Icons.error_outlined),
                      ),
                  );
                },
            ),
          ),
          const SizedBox(height: 20,),
         SmoothPageIndicator(
           controller: controller,
           count:  bannerCubit.length,
           effect:   ExpandingDotsEffect(
             spacing:  5.0,
             radius:  6.0,
             dotWidth:  6,
             dotHeight:  6,
             dotColor:  AppColors.blue.withOpacity(0.2),
             activeDotColor:  AppColors.purple,
        ),
      )
        ],
      ),
    );
  }
}
