part of 'account_cubit.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState({
    CustomerModel? customerModel,
    @Default(false) bool loading,
    Exception? exception,
  }) = _AccountState;
}
