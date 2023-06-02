import '../api/cart_api.dart';
import '../model/cart/cart_model.dart';

class CartController {
  final _cartApi = CartApi();

  Future<List<CartModel>> index() async {
    final cart = await _cartApi.index();

    return cart;
  }

  Future<void> upsert(CartModel cartModel) async {
    await _cartApi.upsert(cartModel);
  }
}
