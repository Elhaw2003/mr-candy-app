import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy_app/featuers/login/data/repos/login_repo.dart';
import 'package:mr_candy_app/featuers/login/presentation/controller/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.loginRepo) : super(InitialLoginState());

  final LoginRepo loginRepo;

  loginFunInCubit(
  {
    required String email,
    required String pass,
}
)
  async{
    emit(LoadingLoginState());
    var result =await loginRepo.loginFunc(email: email, pass: pass);
    return result.fold(
        (left){
          emit(FailureLoginState(errorMessege: left.message));
        },
        (right){
          emit(SuccessLoginState(userModel: right));
  });
}
}
