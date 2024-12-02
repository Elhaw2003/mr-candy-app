import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mr_candy_app/features/create_account/presentation/controller/register/register_states.dart';
import '../../../../../core/utilities/my_hive.dart';
import '../../../data/models/user_model_for_register.dart';
import '../../../data/repo/register_repo.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit({ required this.registerRepo}) : super(InitialRegisterState());

  final RegisterRepo registerRepo;

  registerFunInCubit(
  {
    required UserModelForRegister userModelForRegister
}
)
  async{
    emit(LoadingRegisterState());
    var result =await registerRepo.registerFunc(
        userModelForRegister: userModelForRegister
    );
    return result.fold(
        (left){
          emit(FailureRegisterState(errorMessage: left.message));
        },
        (right)async{
          var box = Hive.box(MyHive.settings);
         await box.put("token", right.token);
          emit(SuccessRegisterState(userModel: right));
  });
}
}
