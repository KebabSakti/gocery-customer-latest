import 'package:freezed_annotation/freezed_annotation.dart';

import '../product/product_model.dart';

part 'bundle_model.freezed.dart';
part 'bundle_model.g.dart';

@freezed
class BundleModel with _$BundleModel {
  const factory BundleModel({
    String? id,
    String? name,
    String? image,
    String? description,
    List<ProductModel>? products,
  }) = _BundleModel;

  factory BundleModel.fromJson(Map<String, dynamic> json) =>
      _$BundleModelFromJson(json);
}
