import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utilities/app_colors.dart';
import '../../../controller/most_selling/most_selling_cubit.dart';
class MostSellingGridView extends StatelessWidget {
  const MostSellingGridView({super.key,});
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<MostSellingCubit>(context);
    return SizedBox(
      height: 250,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        separatorBuilder: (context, index) => const SizedBox(width: 20,),
        scrollDirection: Axis.horizontal,
        itemCount: cubit.products.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 200,
                      height: 190,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors.grey.withOpacity(0.10)
                      ),
                      child: CachedNetworkImage(
                        height: 100,
                        width: 100,
                        fit: BoxFit.contain,
                        imageUrl: cubit.products[index].image.isNotEmpty
                            ? cubit.products[index].image
                            : 'https://via.placeholder.com/200',  // Fallback image URL
                        placeholder: (context, url) => const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => const Icon(Icons.error_outlined),
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
                          "${cubit.products[index].discount} %",
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      bottom: -36,
                      child: Container(
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
                    ),
                  ],
                ),
                const SizedBox(height: 4,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          textAlign: TextAlign.end,
                          "cubit.products[index].name,",
                          style: const TextStyle(
                              color: AppColors.brown,
                              fontWeight: FontWeight.w400,
                              fontSize: 12
                          ),
                        ),
                        Text(
                          textAlign: TextAlign.end,
                          "${cubit.products[index].price}",
                          maxLines:  1,
                          style: const TextStyle(
                              color: AppColors.mixPurpleAndBlue,
                              fontWeight: FontWeight.w700,
                              fontSize: 14
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
      ),
    );
  }
}
