import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy_app/features/create_account/presentation/view/widgets/create_account_body.dart';
import '../../data/repo/register_repo_implementation.dart';
import '../controller/image/select_image_cubit.dart';
import '../controller/register/register_cubit.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RegisterCubit(registerRepo: RegisterRepoImplementation()),
          ),
         BlocProvider(
           create: (context) => ImageCubit(),
         )
        ],
        child: const CreateAccountBody(),
      ),
    );
  }
}
