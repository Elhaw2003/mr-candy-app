import 'package:flutter/material.dart';
import 'package:mr_candy_app/featuers/login/presentation/views/widgets/gredient_color_for_screen.dart';
import 'package:mr_candy_app/featuers/login/presentation/views/widgets/login_form.dart';
import 'package:mr_candy_app/featuers/splash/presentation/views/widgets/image_logo_widget.dart';

import '../../../../../core/utilies/app_colors.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return   const Stack(
      children: [
        GredientColorForScreen(),
        Padding(
          padding: EdgeInsets.only(
            top: 80
          ),
          child: Column(
            children: [
              ImageLogoWidget(),
              SizedBox(height: 30,),
              Expanded(
                child: LoginForm()
              )
            ],
          ),
        )
      ],
    );
  }
}
