import 'package:flutter/material.dart';
import 'package:mr_candy_app/featuers/splash/presentation/views/splash_screen.dart';

void main(){
  runApp(const MrCandyApp());
}
class MrCandyApp extends StatelessWidget {
  const MrCandyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
