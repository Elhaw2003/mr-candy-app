import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy_app/featuers/create_account/presentation/controller/register/register_states.dart';
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
        (right){
          emit(SuccessRegisterState(userModel: right));
  });
}
}
