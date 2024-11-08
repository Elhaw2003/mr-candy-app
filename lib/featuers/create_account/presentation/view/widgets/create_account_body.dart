import 'package:flutter/material.dart';
import 'package:mr_candy_app/featuers/create_account/presentation/view/widgets/create_account_form.dart';

import '../../../../../core/utilies/app_colors.dart';
import '../../../../login/presentation/views/widgets/gredient_color_for_screen.dart';
import '../../../../splash/presentation/views/widgets/image_logo_widget.dart';

class CreateAccountBody extends StatelessWidget {
  const CreateAccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        GredientColorForScreen(
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
                  child: CreateAccountForm()
              )
            ],
          ),
        )
      ],
    );
  }
}
