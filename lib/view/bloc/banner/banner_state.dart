part of 'banner_cubit.dart';

@freezed
class BannerState with _$BannerState {
  const factory BannerState({
    @Default([]) List<BannerModel> banners,
    @Default(false) bool loading,
    Exception? exception,
  }) = _BannerState;
}
