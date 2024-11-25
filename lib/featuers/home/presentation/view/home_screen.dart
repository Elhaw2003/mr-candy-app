import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy_app/featuers/cart/presentation/view/cart_screen.dart';
import 'package:mr_candy_app/featuers/favorite/presentation/view/favorite_screen.dart';
import 'package:mr_candy_app/featuers/home/presentation/view/main_home/widgets/main_home_widget.dart';
import 'package:mr_candy_app/featuers/home/presentation/view/widgets/bottom_bar_widget.dart';
import 'package:mr_candy_app/featuers/setting/presentation/view/setting_screen.dart';

import '../controller/banner/banner_cubit.dart';
import '../controller/category/category_cubit.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<BannerCubit>(context).getBanner();
    BlocProvider.of<CategoryCubit>(context).getCategories();
  }
  int currentIndex = 0;
  List<Widget> list = [const MainHomeWidget(),const CartScreen(),const FavoriteScreen(),const SettingScreen()];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: list[currentIndex],
      bottomNavigationBar: BottomBarWidget(
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
      )
    );
  }
}
