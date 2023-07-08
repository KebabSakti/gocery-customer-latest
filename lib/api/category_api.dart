import 'package:flutter/foundation.dart';

import '../common/config/const.dart';
import '../common/helper/network.dart';
import '../common/helper/utility.dart';
import '../model/category/category_model.dart';

class CategoryApi {
  final _http = NetworkClient();

  Future<List<CategoryModel>> index({Map<String, dynamic>? option}) async {
    final request = await _http.get(category, query: option);
    final json = await compute(parseJson, request.body);

    final categories = List<CategoryModel>.from(
        json.map((item) => CategoryModel.fromJson(item)));

    return categories;
  }
}
