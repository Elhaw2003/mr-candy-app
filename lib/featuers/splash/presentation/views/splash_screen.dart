import 'package:flutter/material.dart';
import 'package:mr_candy_app/featuers/onboarding/presentation/views/onboarding_screen.dart';
import 'package:mr_candy_app/featuers/splash/presentation/views/widgets/splash_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(
        const Duration(seconds: 4),
        (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (c){
            return const OnboardingScreen();
          }));
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }
}
