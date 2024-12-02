import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../../../core/utilities/my_hive.dart';
import '../../../data/repos/login_repo.dart';
import 'login_states.dart';

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
          emit(FailureLoginState(errorMessage: left.message));
        },
        (right)async{
          var box = Hive.box(MyHive.settings);
          await box.put("token", right.token);
          emit(SuccessLoginState(userModel: right));
  });
}
}
