import 'package:dartz/dartz.dart';
import 'package:mr_candy_app/core/errors/failure.dart';

import '../../models/category_model.dart';
abstract class CategoriesRepo{

  Future<Either<Failure,List<CategoryModel>>> getCategories();


}