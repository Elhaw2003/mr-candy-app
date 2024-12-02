
import '../../../data/models/user_model.dart';

abstract class LoginStates{}
class InitialLoginState extends LoginStates{}
class LoadingLoginState extends LoginStates{}
class FailureLoginState extends LoginStates{
  final String errorMessage;
  FailureLoginState({required this.errorMessage});
}
class SuccessLoginState extends LoginStates{
  final UserModel userModel;

  SuccessLoginState({required this.userModel});
}