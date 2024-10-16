import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy_app/featuers/login/data/repos/login_implementation_repo.dart';
import 'package:mr_candy_app/featuers/login/presentation/controller/login_cubit.dart';
import 'package:mr_candy_app/featuers/login/presentation/views/widgets/login_body.dart';

import '../../../../core/utilies/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mixPurpleAndBlue,
      body: BlocProvider(
        create: (context) => LoginCubit(LoginImplementationRepo()),
        child: const LoginBody(),
      ),
    );
  }
}
