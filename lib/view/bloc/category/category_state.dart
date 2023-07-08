part of 'category_cubit.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState({
    @Default(<CategoryModel>[]) List<CategoryModel> categories,
    @Default(false) bool loading,
    Exception? exception,
  }) = _CategoryState;
}
