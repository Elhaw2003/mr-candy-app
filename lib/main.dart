import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/utilities/app_fonts.dart';
import 'core/utilities/my_hive.dart';
import 'features/home/data/repos/banner/banner_repo_implementation.dart';
import 'features/home/data/repos/categories/categories_repo_implementation.dart';
import 'features/home/data/repos/most_selling/most_selling_repo_implementation.dart';
import 'features/home/presentation/controller/banner/banner_cubit.dart';
import 'features/home/presentation/controller/category/category_cubit.dart';
import 'features/home/presentation/controller/most_selling/most_selling_cubit.dart';
import 'features/home/presentation/view/home_screen.dart';
import 'features/splash/presentation/views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(MyHive.settings);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => BannerCubit(bannerRepo: BannerRepoImplementation())),
      BlocProvider(create: (context) => CategoryCubit(categoryRepo: CategoriesRepoImplementation())),
      BlocProvider(create: (context) => MostSellingCubit(mostSellingRepo: MostSellingRepoImplementation())),
    ],
    child: const MrCandyApp(),
  ));
}

class MrCandyApp extends StatelessWidget {
  const MrCandyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: AppFonts.almarai,
      ),
      debugShowCheckedModeBanner: false,
      home: Hive.box(MyHive.settings).get("token") == null
          ? const SplashScreen()
          : const HomeScreen(),
    );
  }
}
