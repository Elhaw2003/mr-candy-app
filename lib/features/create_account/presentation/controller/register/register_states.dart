
import '../../../../login/data/models/user_model.dart';

abstract class RegisterStates{}
class InitialRegisterState extends RegisterStates{}
class LoadingRegisterState extends RegisterStates{}
class FailureRegisterState extends RegisterStates{
  final String errorMessage;
  FailureRegisterState({required this.errorMessage});
}
class SuccessRegisterState extends RegisterStates{
  final UserModel userModel;
  SuccessRegisterState({required this.userModel});
}