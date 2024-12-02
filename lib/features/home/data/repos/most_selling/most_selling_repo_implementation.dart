import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:mr_candy_app/core/apis/end_points.dart';
import 'package:mr_candy_app/core/errors/failure.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/utilities/app_texts.dart';
import '../../models/most_selling_model.dart';
import 'most_selling_repo.dart';
class MostSellingRepoImplementation implements MostSellingRepo {
  @override
  Future<Either<Failure, List<MostSellingModel>>> getMostSelling() async {
    List<MostSellingModel> products = [];
    try {
      var response =
          await http.get(Uri.parse(EndPoints.baseUrl + EndPoints.home));
      var body = jsonDecode(response.body);
      if (body["status"] && body["data"]["products"] != null) {
        for (var data in body["data"]["products"]) { // "products" should be iterable.
          MostSellingModel mostSellingModel = MostSellingModel(
            price: data["price"].toDouble(), // Ensure price is a double
            discount: data["discount"],
            image: data["image"],
            name: data["name"],
            description: data["description"],
          );
          products.add(mostSellingModel);
        }
        return right(products);
      } else {
        return left(ApiFailure(message: body["message"] ?? "Unknown error"));
      }
  }catch (e){
      return left(ApiFailure(message: AppTexts.error));
    }
    }
}
