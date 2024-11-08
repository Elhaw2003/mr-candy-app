abstract class BannerStates{}
class InitialBannerState extends BannerStates {}
class LoadingBannerState extends BannerStates {}
class SuccessBannerState extends BannerStates {}
class FailureBannerState extends BannerStates {
  final String errorMessage;
  FailureBannerState({required this.errorMessage});
}