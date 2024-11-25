abstract class CategoryStates{}
class InitialCategoryState extends CategoryStates {}
class LoadingCategoryState extends CategoryStates {}
class SuccessCategoryState extends CategoryStates {}
class FailureCategoryState extends CategoryStates {
  final String errorMessage;
  FailureCategoryState({required this.errorMessage});
}