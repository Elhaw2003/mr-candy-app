import 'package:mr_candy_app/featuers/login/data/models/user_model.dart';

abstract class LoginStates{}
class InitialLoginState extends LoginStates{}
class LoadingLoginState extends LoginStates{}
class FailureLoginState extends LoginStates{
  final String errorMessege;
  FailureLoginState({required this.errorMessege});
}
class SuccessLoginState extends LoginStates{
  final UserModel userModel;

  SuccessLoginState({required this.userModel});
}