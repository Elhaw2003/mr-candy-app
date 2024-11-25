import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:mr_candy_app/core/apis/end_points.dart';
import 'package:mr_candy_app/core/errors/failure.dart';
import 'package:mr_candy_app/core/utilies/app_texts.dart';
import 'package:http/http.dart'as http;

import '../../models/category_model.dart';
import 'categories_repo.dart';
class CategoriesRepoImplementation implements CategoriesRepo{
  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async{
    List<CategoryModel> categories = [];
    try{
      var response = await http.get(
        Uri.parse(EndPoints.baseUrl + EndPoints.categories)
      );
       var body = jsonDecode(response.body);
       if(body["status"]){
         for(var data in body["data"]["data"]){
           CategoryModel categoryModel = CategoryModel(image: data["image"], title: data["name"]);
           categories.add(categoryModel);
         }
         return right(categories);
       }else{
         return left(ApiFailure(message: body["message"]));
       }
    }catch(e){
      return left(ApiFailure(message: AppTexts.error));
    }
  }
}