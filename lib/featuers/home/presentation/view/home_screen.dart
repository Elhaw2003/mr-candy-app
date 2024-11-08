import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy_app/featuers/home/data/repos/banner/banner_repo_implementation.dart';
import 'package:mr_candy_app/featuers/home/presentation/controller/banner/banner_cubit.dart';
import 'package:mr_candy_app/featuers/home/presentation/view/widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeBody(),
    );
  }
}
