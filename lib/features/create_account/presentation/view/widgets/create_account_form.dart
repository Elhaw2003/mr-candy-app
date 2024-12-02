import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy_app/core/widgets/custom_button.dart';
import '../../../../../core/utilities/app_colors.dart';
import '../../../../../core/utilities/app_texts.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../data/models/user_model_for_register.dart';
import '../../controller/image/select_image_cubit.dart';
import '../../controller/register/register_cubit.dart';
import '../../controller/register/register_states.dart';
import 'avatar_image.dart';

class CreateAccountForm extends StatelessWidget {
 const CreateAccountForm({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
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
          const SizedBox(height: 25,),
          const AvatarImage(),
          const SizedBox(height: 32,),
          CustomTextFormField(
            controller: nameController,
            text: AppTexts.insertName,
            icon: const Icon(
              Icons.person, color: AppColors.mixPurpleAndBlue,),
          ),
          const SizedBox(height: 24,),
          CustomTextFormField(
            controller: emailController,
            text: AppTexts.insertEmail,
            icon: const Icon(
              Icons.email_outlined, color: AppColors.mixPurpleAndBlue,),
          ),
          const SizedBox(height: 24,),
          CustomTextFormField(
            controller: phoneController,
            text: AppTexts.insertPhone,
            icon: const Icon(
              Icons.phone_in_talk_rounded, color: AppColors.mixPurpleAndBlue,),
          ),
          const SizedBox(height: 24,),
          CustomTextFormField(
            controller: passwordController,
            text: AppTexts.insertPassword,
            icon: const Icon(
              Icons.lock_outlined, color: AppColors.mixPurpleAndBlue,),
          ),
          const SizedBox(height: 30,),
          Center(
            child: GestureDetector(
              onTap: () {
                final bool emailValid =
                RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(emailController.text.trim());
                if(emailValid!= true){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      AppTexts.insertCorrectEmail,
                      style: TextStyle(
                          fontWeight: FontWeight.w600
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    backgroundColor: AppColors.mixPurpleAndBlue,
                  ));
                }
                // bool validateStructure(String value){
                //   String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                //   RegExp regExp =  RegExp(pattern);
                //   return regExp.hasMatch(value);
                // }
                // if(!validateStructure(passwordController.text.trim())){
                //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                //     content: Text(
                //       AppTexts.insertCorrectPassword,
                //       style: TextStyle(
                //           fontWeight: FontWeight.w600
                //       ),
                //       textDirection: TextDirection.rtl,
                //     ),
                //     backgroundColor: AppColors.mixPurpleAndBlue,
                //   ));
                // }
               else if(BlocProvider.of<ImageCubit>(context).base64Image == null){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      AppTexts.addImageProfile,
                      style: TextStyle(
                          fontWeight: FontWeight.w600
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    backgroundColor: AppColors.mixPurpleAndBlue,
                  ));
                }else{
                  BlocProvider.of<RegisterCubit>(context).registerFunInCubit(
                    userModelForRegister: UserModelForRegister(
                        name: nameController.text.trim(),
                        email: emailController.text.trim(),
                        phone: phoneController.text.trim(),
                        image: BlocProvider.of<ImageCubit>(context).base64Image!,
                        password: passwordController.text.trim()
                    )
                );
                }
              },
              child: BlocConsumer<RegisterCubit, RegisterStates>(
                listener: (context, state) {
                  if(state is FailureRegisterState){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        state.errorMessage,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      backgroundColor: AppColors.mixPurpleAndBlue,
                    ));
                  }else if(state is SuccessRegisterState){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        style:  TextStyle(
                            fontWeight: FontWeight.w600
                        ),
                        AppTexts.successCreateAnAccount,
                        textDirection: TextDirection.rtl,
                      ),
                      backgroundColor: AppColors.mixPurpleAndBlue,
                    ));
                  }
                },
                builder: (context, state) {
                  return state is LoadingRegisterState ?  const CircularProgressIndicator(
                    color: AppColors.mixPurpleAndBlue,
                  ): const CustomButton(
                      text: AppTexts.createAnAccount
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 18,),
           Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: const Text(
                      AppTexts.login,
                      style: TextStyle(
                          color: AppColors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 12
                      ),
                    ),
                  ),
                  const Text(
                    AppTexts.haveYouAccount,
                    style: TextStyle(
                        color: AppColors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 12
                    ),
                  ),
                ],
              ),
              const Divider(
                color: AppColors.grey,
                height: 0,
                indent: 90,
                endIndent: 174,
              )
            ],
          ),
        ],
      ),
    );
  }
}
