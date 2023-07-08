import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/helper/utility.dart';
import '../../../controller/cart_controller.dart';
import '../../../model/cart/cart_model.dart';

part 'cart_cubit.freezed.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());

  final _cartController = CartController();

  Future<void> load() async {
    try {
      emit(state.copyWith(loading: true));
      final cart = await _cartController.index();
      emit(CartState(cart: cart));
    } on Exception catch (e) {
      emit(state.copyWith(loading: false, exception: e));
    }
  }

  Future<void> increment(CartModel cartModel) async {
    final index = state.cart
        .indexWhere((element) => element.productId == cartModel.productId);

    if (index >= 0) {
      final cartItem = state.cart[index];
      final qty = cartItem.qty! + 1;
      final total = qty * cartItem.price!;
      final updatedCart = List<CartModel>.from(state.cart);
      updatedCart[index] = cartItem.copyWith(qty: qty, total: total);

      _cartController.upsert(cartItem.copyWith(qty: qty));
      emit(CartState(cart: updatedCart));
    }

    if (index < 0) {
      final cartItem = cartModel.copyWith(qty: 1, id: uuid());
      final updatedCart = [cartItem];

      _cartController.upsert(cartItem);
      emit(CartState(cart: updatedCart));
    }
  }

  Future<void> decrement(CartModel cartModel) async {
    final index = state.cart
        .indexWhere((element) => element.productId == cartModel.productId);

    if (index >= 0) {
      final cartItem = state.cart[index];
      final qty = cartItem.qty! - 1;
      final total = qty * cartItem.price!;
      final updatedCart = List<CartModel>.from(state.cart);

      if (qty > 0) {
        updatedCart[index] = cartItem.copyWith(qty: qty, total: total);

        _cartController.upsert(cartItem.copyWith(qty: qty));
        emit(CartState(cart: updatedCart));
      } else {
        delete(cartItem.id!);
      }
    }
  }

  Future<void> delete(String cartId) async {
    try {
      _cartController.delete(cartId);

      final updatedCart = List<CartModel>.from(state.cart)
        ..removeWhere((element) => element.id == cartId);

      emit(CartState(cart: updatedCart));
    } on Exception catch (e) {
      emit(state.copyWith(loading: false, exception: e));
    }
  }

  CartModel? item(String productId) {
    CartModel? cartModel;

    final index =
        state.cart.indexWhere((element) => element.productId == productId);

    if (index > 0) {
      cartModel = state.cart[index];
    }

    return cartModel;
  }
}
