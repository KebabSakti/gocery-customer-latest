import '../api/category_api.dart';
import '../model/category/category_model.dart';

class CategoryController {
  final _categoryApi = CategoryApi();

  Future<List<CategoryModel>> index({Map<String, dynamic>? option}) async {
    final categories = await _categoryApi.index(option: option);

    return categories;
  }
}
