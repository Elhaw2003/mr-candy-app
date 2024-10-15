import 'package:dartz/dartz.dart';
import 'package:mr_candy_app/core/errors/failure.dart';
import 'package:mr_candy_app/featuers/login/data/models/user_model.dart';

abstract class LoginRepo{
 Future<Either<Failure,UserModel>> loginFunc(
  {
    required String email,
    required String pass,
}
      );
}