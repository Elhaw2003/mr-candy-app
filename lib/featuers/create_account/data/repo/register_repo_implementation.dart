import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mr_candy_app/core/apis/end_points.dart';
import 'package:mr_candy_app/core/errors/failure.dart';
import 'package:mr_candy_app/core/utilies/app_texts.dart';
import 'package:mr_candy_app/featuers/create_account/data/repo/register_repo.dart';
import 'package:mr_candy_app/featuers/login/data/models/user_model.dart';
import 'package:http/http.dart' as http;

import '../models/user_model_for_register.dart';

class RegisterRepoImplementation implements RegisterRepo {
  @override
  Future<Either<Failure, UserModel>> registerFunc(
      {required UserModelForRegister userModelForRegister}) async {
    try {
      var response = await http
          .post(Uri.parse(EndPoints.baseUrl + EndPoints.register),
          body: userModelForRegister.toJson()
      );

      var body = jsonDecode(response.body);
      if (body["status"]) {
        return right(UserModel(
            id: body["data"]["id"],
            name: body["data"]["name"],
            email: body["data"]["email"],
            phone: body["data"]["phone"],
            image: body["data"]["image"],
            points: 0,
            credit: 0,
            token: body["data"]["token"]));
      } else {
        return left(ApiFailure(message: body["message"]));
      }
    }on SocketException{

      return left(NoInternet(message: AppTexts.noInterNet));

    }
    catch (e) {
      print(e.toString());
      return left(ApiFailure(message: AppTexts.error));
    }
  }
}
