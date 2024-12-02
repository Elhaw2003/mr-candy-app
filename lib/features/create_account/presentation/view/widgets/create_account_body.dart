import 'package:flutter/material.dart';
import '../../../../../core/utilities/app_colors.dart';
import '../../../../login/presentation/views/widgets/gradient_color_for_screen.dart';
import '../../../../splash/presentation/views/widgets/image_logo_widget.dart';
import 'create_account_form.dart';

class CreateAccountBody extends StatelessWidget {
  const CreateAccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
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
                  child: CreateAccountForm()
              )
            ],
          ),
        )
      ],
    );
  }
}
