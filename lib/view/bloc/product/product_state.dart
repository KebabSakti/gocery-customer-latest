part of 'product_cubit.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState({
    @Default(<ProductModel>[]) List<ProductModel> products,
    @Default(false) bool loading,
    @Default(false) bool loadingMore,
    QueryModel? filter,
    Exception? exception,
  }) = _ProductState;
}
