import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gocery/controller/category_controller.dart';

import '../../../model/category/category_model.dart';

part 'category_cubit.freezed.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(const CategoryState());

  final _categoryController = CategoryController();

  Future<void> load({Map<String, dynamic>? option}) async {
    try {
      emit(state.copyWith(loading: true));

      final categories = await _categoryController.index(option: option);

      emit(CategoryState(categories: categories));
    } on Exception catch (e) {
      emit(state.copyWith(loading: false, exception: e));
    }
  }
}
