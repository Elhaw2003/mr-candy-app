import 'package:flutter/material.dart';
import 'package:mr_candy_app/core/utilies/app_colors.dart';
import 'package:mr_candy_app/featuers/login/presentation/views/widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: AppColors.purple,
      body: LoginBody(),
    );
  }
}
