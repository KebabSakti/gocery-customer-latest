part of 'app_cubit.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(0) int pageIndex,
    @Default('') String notification,
    @Default(false) bool loading,
    Exception? exception,
  }) = _AppState;
}
