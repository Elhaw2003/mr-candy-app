import 'package:flutter/material.dart';

import '../../../../../core/utilities/app_colors.dart';
import '../../../../splash/presentation/views/widgets/image_logo_widget.dart';
import 'gradient_color_for_screen.dart';
import 'login_form.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return     const Stack(
      children: [
        GradientColorForScreen(
          color1: AppColors.blue,
          color2: AppColors.purple,
        ),
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
