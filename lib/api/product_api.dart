import 'package:flutter/foundation.dart';

import '../common/config/const.dart';
import '../common/helper/network.dart';
import '../common/helper/utility.dart';
import '../model/core/query_model.dart';
import '../model/product/product_model.dart';

class ProductApi {
  final _http = NetworkClient();

  Future<List<ProductModel>> index({QueryModel? option}) async {
    final request = await _http.get(product, query: option?.toJson());
    final json = await compute(parseJson, request.body);

    final products = List<ProductModel>.from(
        json.map((item) => ProductModel.fromJson(item)));

    return products;
  }
}
