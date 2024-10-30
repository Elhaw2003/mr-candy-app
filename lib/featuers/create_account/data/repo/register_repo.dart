import 'package:dartz/dartz.dart';
import 'package:mr_candy_app/core/errors/failure.dart';
import 'package:mr_candy_app/featuers/login/data/models/user_model.dart';

import '../models/user_model_for_register.dart';

abstract class RegisterRepo{
  Future<Either<Failure,UserModel>> registerFunc(
      {
        required UserModelForRegister userModelForRegister
      }
      );
}