import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mr_candy_app/core/apis/end_points.dart';
import 'package:mr_candy_app/core/errors/failure.dart';
import 'package:mr_candy_app/core/utilies/app_texts.dart';
import 'package:mr_candy_app/featuers/login/data/models/user_model.dart';
import 'package:mr_candy_app/featuers/login/data/repos/login_repo.dart';
import 'package:http/http.dart' as http;

class LoginImplementationRepo implements LoginRepo {
  @override
  Future<Either<Failure, UserModel>> loginFunc(
      {required String email, required String pass}) async {
    try {
      var response = await http
          .post(Uri.parse(EndPoints.baseUrl + EndPoints.login), body: {
        "email": email,
        "password": pass,
      });

      var body = jsonDecode(response.body);
      if (body["status"]) {
        return right(UserModel(
            id: body["data"]["id"],
            name: body["data"]["name"],
            email: body["data"]["email"],
            phone: body["data"]["phone"],
            image: body["data"]["image"],
            points: body["data"]["points"],
            credit: body["data"]["credit"],
            token: body["data"]["token"]));
      } else {
        return left(ApiFailure(message: body["message"]));
      }
    }on SocketException{
      
      return left(NoInternet(message: AppTexts.noInterNet));
      
    }
    
    catch (e) {

      return left(ApiFailure(message: AppTexts.error));
    }
  }
}
