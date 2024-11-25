import 'package:dartz/dartz.dart';
import 'package:mr_candy_app/core/errors/failure.dart';
import 'package:mr_candy_app/featuers/home/data/models/most_selling_model.dart';

abstract class MostSellingRepo{

  Future<Either<Failure,List<MostSellingModel>>> getMostSelling();


}