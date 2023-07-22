import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../controller/product_controller.dart';
import '../../../model/core/query_model.dart';
import '../../../model/product/product_model.dart';

part 'product_cubit.freezed.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(const ProductState());

  final _productController = ProductController();

  Future<void> load({QueryModel? option}) async {
    try {
      emit(state.copyWith(loading: true));

      final products = await _productController.index(option: option);

      emit(ProductState(products: products));
    } on Exception catch (e) {
      emit(state.copyWith(loading: false, exception: e));
    }
  }

  Future<void> loadMore({QueryModel? option}) async {
    try {
      emit(state.copyWith(loadingMore: true));

      final products = await _productController.index(option: option);
      final updatedProducts = state.products + products;

      emit(state.copyWith(loadingMore: false, products: updatedProducts));
    } on Exception catch (e) {
      emit(state.copyWith(loading: false, exception: e));
    }
  }

  void filter(QueryModel filter) {
    emit(state.copyWith(filter: filter));
  }
}
