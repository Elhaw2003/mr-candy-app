import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy_app/core/widgets/custom_button.dart';
import 'package:mr_candy_app/core/widgets/custom_text_form_field.dart';

import '../../../../../core/utilies/app_colors.dart';
import '../../../../../core/utilies/app_texts.dart';
import '../../../../../core/utilies/app_texts.dart';
import '../../controller/login_cubit.dart';
import '../../controller/login_states.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          )
      ),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        children: [
          const SizedBox(height: 60,),
          CustomTextFormField(
            controller: emailController,
            text: AppTexts.insertEmail,
            icon: const Icon(
              Icons.email_outlined, color: AppColors.mixPurpleAndBlue,),
          ),
          const SizedBox(height: 24,),
          CustomTextFormField(
            controller: passwordController,
            text: AppTexts.insertPassword,
            icon: const Icon(
              Icons.lock_outlined, color: AppColors.mixPurpleAndBlue,),
          ),
          const SizedBox(height: 46,),
          Center(
              child:
              BlocConsumer<LoginCubit, LoginStates>(
                listener: (context, state) {
                  if(state is FailureLoginState){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            state.errorMessege,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600
                            ),
                            textDirection: TextDirection.rtl,
                        ),
                        backgroundColor: AppColors.mixPurpleAndBlue,
                    ));
                  }else if(state is SuccessLoginState){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          style:  TextStyle(
                              fontWeight: FontWeight.w600
                          ),
                            AppTexts.successEnter,
                          textDirection: TextDirection.rtl,
                        ),
                      backgroundColor: AppColors.mixPurpleAndBlue,
                    ));
                  }
                },
                builder: (context, state) {
                  return state is LoadingLoginState ?  const CircularProgressIndicator(
                    color: AppColors.mixPurpleAndBlue,
                  ):
                  CustomButton(
                    text: AppTexts.login,
                    onTap: (){
                      BlocProvider.of<LoginCubit>(context).loginFunInCubit(
                          email: emailController.text.trim(),
                          pass:  passwordController.text.trim(),
                      );
                    },
                  );
                },
              )),
          const SizedBox(height: 24,),
          const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppTexts.createAccount,
                    style: TextStyle(
                        color: AppColors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 12
                    ),
                  ),
                  Text(
                    AppTexts.haveNotAnyAccount,
                    style: TextStyle(
                        color: AppColors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 12
                    ),
                  ),
                ],
              ),
              Divider(
                color: AppColors.grey,
                height: 0,
                indent:80,
                endIndent: 174,
              )
            ],
          ),
        ],
      ),
    );
  }
}
