part of 'bundle_cubit.dart';

@freezed
class BundleState with _$BundleState {
  const factory BundleState({
    @Default([]) List<BundleModel> bundles,
    @Default(false) bool loading,
    Exception? exception,
  }) = _BundleState;
}
