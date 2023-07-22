import '../api/product_api.dart';
import '../model/core/query_model.dart';
import '../model/product/product_model.dart';

class ProductController {
  final _productApi = ProductApi();

  Future<List<ProductModel>> index({QueryModel? option}) async {
    final products = await _productApi.index(option: option);

    return products;
  }
}
