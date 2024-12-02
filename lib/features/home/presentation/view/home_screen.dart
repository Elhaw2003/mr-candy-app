import 'package:flutter/material.dart';
import 'package:mr_candy_app/features/home/presentation/view/widgets/bottom_bar_widget.dart';

import '../../../cart/presentation/view/cart_screen.dart';
import '../../../favorite/presentation/view/favorite_screen.dart';
import '../../../setting/presentation/view/setting_screen.dart';
import 'main_home/widgets/main_home_widget.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> screens = [const MainHomeWidget(),const CartScreen(),const FavoriteScreen(),const SettingScreen()];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: screens[currentIndex],
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
