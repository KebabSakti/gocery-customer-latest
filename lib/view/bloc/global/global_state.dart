part of 'global_cubit.dart';

@freezed
class GlobalState with _$GlobalState {
  const factory GlobalState({
    @Default(ConfigModel()) ConfigModel configModel,
    @Default(false) bool loading,
    Exception? exception,
  }) = _GlobalState;
}
