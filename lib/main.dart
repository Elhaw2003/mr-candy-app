import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mr_candy_app/core/utilies/my_hive.dart';
import 'package:mr_candy_app/featuers/home/presentation/view/home_screen.dart';
import 'package:mr_candy_app/featuers/splash/presentation/views/splash_screen.dart';

import 'core/utilies/app_fonts.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(MyHive.settings);
  runApp(const MrCandyApp());
}
class MrCandyApp extends StatelessWidget {
  const MrCandyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(

        fontFamily: AppFonts.almarai,
      ),
      debugShowCheckedModeBanner: false,
      home: Hive.box(MyHive.settings).get("token") == null? const SplashScreen():const HomeScreen(),
    );
  }
}
