import 'package:flutter/material.dart';
import 'package:mr_candy_app/featuers/splash/presentation/views/splash_screen.dart';

import 'core/utilies/app_fonts.dart';

void main(){
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
      home: const SplashScreen(),
    );
  }
}
