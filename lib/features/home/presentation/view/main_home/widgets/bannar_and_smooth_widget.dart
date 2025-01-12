import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy_app/features/home/presentation/controller/banner/banner_states.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../../core/utilities/app_colors.dart';
import '../../../controller/banner/banner_cubit.dart';

class BannerAndSmoothWidget extends StatefulWidget {
  const BannerAndSmoothWidget({super.key});

  @override
  State<BannerAndSmoothWidget> createState() => _BannerAndSmoothWidgetState();
}

class _BannerAndSmoothWidgetState extends State<BannerAndSmoothWidget> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var bannerCubit = BlocProvider.of<BannerCubit>(context).banners;
    return BlocBuilder<BannerCubit, BannerStates>(
      builder: (context, state) {
        return state is LoadingBannerState
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  SizedBox(
                    height: height * 0.19,
                    width: width,
                    child: CarouselSlider(
                        items: [
                          ...bannerCubit.map((banner) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                width: width * 0.9,
                                fit: BoxFit.cover,
                                imageUrl: banner.image != null &&
                                        banner.image.isNotEmpty
                                    ? banner.image
                                    : 'https://via.placeholder.com/200', // Fallback image URL
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error_outlined),
                              ),
                            );
                          }),
                        ],
                        options: CarouselOptions(
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          onPageChanged: (index, a) {
                            pageIndex = index;
                            setState(() {});
                          },
                          scrollDirection: Axis.horizontal,
                        )),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  bannerCubit.isEmpty
                      ? const Text("")
                      : SmoothPageIndicator(
                          // textDirection: TextDirection.ltr,
                          controller: PageController(initialPage: pageIndex),
                          count: bannerCubit.length,
                          effect: ExpandingDotsEffect(
                            spacing: 5.0,
                            radius: 6.0,
                            dotWidth: 6,
                            dotHeight: 6,
                            dotColor: AppColors.blue.withOpacity(0.2),
                            activeDotColor: AppColors.purple,
                          ),
                        ),
                ],
              );
      },
    );
  }
}
