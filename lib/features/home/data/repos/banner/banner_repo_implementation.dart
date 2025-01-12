import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mr_candy_app/core/apis/end_points.dart';
import 'package:mr_candy_app/core/errors/failure.dart';
import 'package:http/http.dart'as http;

import '../../../../../core/utilities/app_texts.dart';
import '../../models/banner_model.dart';
import 'banner_repo.dart';
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
         // var r = List<BannerModel>.from((body["data"] as List).map((e)=>BannerModel(image: e ["image"])));
         return right(banners);
       }else{
         return left(ApiFailure(message: body["message"]));
       }
    }on SocketException{
      return  left(NoInternet(message: AppTexts.noInterNet));
    }
    catch(e){
      return left(ApiFailure(message: AppTexts.error));
    }
  }
}