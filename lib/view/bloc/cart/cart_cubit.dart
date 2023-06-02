import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../controller/cart_controller.dart';
import '../../../model/cart/cart_model.dart';

part 'cart_cubit.freezed.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());

  final _cartController = CartController();

  Future<void> load() async {
    emit(state.copyWith(loading: true));
    final cart = await _cartController.index();
    emit(state.copyWith(cart: cart, loading: false, exception: null));
  }

  Future<void> upsert(CartModel cartModel) async {
    _cartController.upsert(cartModel);
    final totalCart = cartModel.qty! * cartModel.price!;
    final index = state.cart
        .indexWhere((element) => element.productId == cartModel.productId);
    final updatedCart = List<CartModel>.from(state.cart);
    updatedCart[index] = cartModel.copyWith(total: totalCart);

    emit(state.copyWith(cart: updatedCart, loading: false, exception: null));
  }
}
