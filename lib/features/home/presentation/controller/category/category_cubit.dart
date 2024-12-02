import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/category_model.dart';
import '../../../data/repos/categories/categories_repo.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit({required this.categoryRepo}) : super(InitialCategoryState());
  final CategoriesRepo categoryRepo;
  List<CategoryModel> categories = [];
  Future<void> getCategories()async{
    emit(LoadingCategoryState());
    var result = await categoryRepo.getCategories();
    return result.fold(
            (left){
          emit(FailureCategoryState(errorMessage: left.message));
        },
            (right){
          categories = right;
          emit(SuccessCategoryState());
        });
  }
}