import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy_app/featuers/home/data/models/most_selling_model.dart';
import 'package:mr_candy_app/featuers/home/data/repos/most_selling/most_selling_repo.dart';
import 'most_selling_state.dart';

class MostSellingCubit extends Cubit<MostSellingStates> {
  MostSellingCubit({required this.mostSellingRepo}) : super(InitialMostSellingState());
  final MostSellingRepo mostSellingRepo;
  List<MostSellingModel> products = [];
  Future<void> getMostSelling()async{
    emit(LoadingMostSellingState());
    var result = await mostSellingRepo.getMostSelling();
    return result.fold(
            (left){
          emit(FailureMostSellingState(errorMessage: left.message));
        },
            (right){
          products = right;
          emit(SuccessMostSellingState());
        });
  }
}