import 'package:dartz/dartz.dart';
import 'package:mr_candy_app/core/errors/failure.dart';

import '../../models/banner_model.dart';

abstract class BannerRepo{

  Future<Either<Failure,List<BannerModel>>> getBanner();


}