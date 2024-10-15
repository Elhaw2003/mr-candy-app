abstract class Failure{
  final String message;

  Failure({required this.message});
}
class ApiFailure extends Failure{
  ApiFailure({required super.message});
}
class NoInternet extends Failure{
  NoInternet({required super.message});
}