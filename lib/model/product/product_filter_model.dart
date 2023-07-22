import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gocery/model/pagination/pagination_model.dart';

part 'product_filter_model.freezed.dart';
part 'product_filter_model.g.dart';

enum ProductSorter { sold }

@freezed
class ProductFilterModel with _$ProductFilterModel {
  const factory ProductFilterModel({
    String? categoryId,
    String? name,
    List<ProductSorter>? sorters,
    PaginationModel? pagination,
  }) = _ProductFilterModel;

  factory ProductFilterModel.fromJson(Map<String, dynamic> json) =>
      _$ProductFilterModelFromJson(json);
}
