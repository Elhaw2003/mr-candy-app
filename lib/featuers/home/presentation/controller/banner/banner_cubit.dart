import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy_app/featuers/home/data/models/banner_model.dart';
import 'package:mr_candy_app/featuers/home/data/repos/banner/banner_repo.dart';

import 'banner_states.dart';

class BannerCubit extends Cubit<BannerStates> {
  BannerCubit({required this.bannerRepo}) : super(InitialBannerState());
 final BannerRepo bannerRepo;
 List<BannerModel> banners = [];
Future<void> getBanner()async{
  emit(LoadingBannerState());
  var result = await bannerRepo.getBanner();
  return result.fold(
          (left){
           emit(FailureBannerState(errorMessage: left.message));
          },
      (right){
            banners = right;
            emit(SuccessBannerState());
          });
 }
}
