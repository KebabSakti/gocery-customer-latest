import "package:freezed_annotation/freezed_annotation.dart";

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    String? id,
    String? categoryId,
    String? name,
    String? description,
    String? image,
    double? point,
    double? price,
    String? unit,
    int? stok,
    int? max,
    int? min,
    int? sold,
    int? view,
    int? like,
    String? created,
    String? updated,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
