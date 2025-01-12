import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mr_candy_app/features/home/presentation/view/main_home/widgets/best_selling.dart';
import '../../../controller/most_selling/most_selling_cubit.dart';
class MostSellingGridView extends StatelessWidget {
  const MostSellingGridView({super.key,});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: ListView.separated(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        separatorBuilder: (context, index) =>  20.horizontalSpace,
        scrollDirection: Axis.horizontal,
        itemCount: BlocProvider.of<MostSellingCubit>(context).products.length,
          itemBuilder: (context, index) {
            return BestSellingWidget(mostSellingModel: BlocProvider.of<MostSellingCubit>(context).products[index]);
          },
      ),
    );
  }
}
