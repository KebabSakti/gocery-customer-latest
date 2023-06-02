import "package:freezed_annotation/freezed_annotation.dart";

part 'cart_model.freezed.dart';
part 'cart_model.g.dart';

@freezed
class CartModel with _$CartModel {
  const factory CartModel({
    String? id,
    String? productId,
    int? qty,
    double? total,
    String? created,
    String? updated,
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
  }) = _CartModel;

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
}
