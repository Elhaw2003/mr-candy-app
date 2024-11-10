import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:mr_candy_app/core/apis/end_points.dart';
import 'package:mr_candy_app/core/errors/failure.dart';
import 'package:mr_candy_app/core/utilies/app_texts.dart';
import 'package:mr_candy_app/featuers/home/data/models/banner_model.dart';
import 'package:mr_candy_app/featuers/home/data/repos/banner/banner_repo.dart';
import 'package:http/http.dart'as http;
class BannerRepoImplementation implements BannerRepo{
  @override
  Future<Either<Failure, List<BannerModel>>> getBanner() async{
    List<BannerModel> banners = [];
    try{
      var response = await http.get(
        Uri.parse(EndPoints.baseUrl + EndPoints.banners)
      );
       var body = jsonDecode(response.body);
       if(body["status"]){
         for(var data in body["data"]){
           BannerModel bannerModel = BannerModel(image: data["image"]);
           banners.add(bannerModel);
         }
         return right(banners);
       }else{
         return left(ApiFailure(message: body["message"]));
       }
    }catch(e){
      return left(ApiFailure(message: AppTexts.error));
    }
  }
}