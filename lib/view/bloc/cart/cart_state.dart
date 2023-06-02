part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({
    @Default([]) List<CartModel> cart,
    @Default(false) bool loading,
    Exception? exception,
  }) = _CartState;
}
