abstract class MostSellingStates{}
class InitialMostSellingState extends MostSellingStates {}
class LoadingMostSellingState extends MostSellingStates {}
class SuccessMostSellingState extends MostSellingStates {}
class FailureMostSellingState extends MostSellingStates {
  final String errorMessage;
  FailureMostSellingState({required this.errorMessage});
}