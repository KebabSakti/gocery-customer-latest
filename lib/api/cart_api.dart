import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../common/config/const.dart';
import '../common/helper/network.dart';
import '../common/helper/utility.dart';
import '../model/cart/cart_model.dart';

class CartApi {
  final _http = GetIt.I<Network>();

  Future<List<CartModel>> index() async {
    final request = await _http.get(cart);
    final json = await compute(parseJson, request.body);

    final cartModel =
        List<CartModel>.from(json.map((item) => CartModel.fromJson(item)));

    return cartModel;
  }

  Future<void> upsert(CartModel cartModel) async {
    final payload = cartModel.toJson();
    removeNullFromMap(payload);
    await _http.post(cart, body: payload);
  }
}
