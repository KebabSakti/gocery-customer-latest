import "package:freezed_annotation/freezed_annotation.dart";

part 'customer_model.freezed.dart';
part 'customer_model.g.dart';

@freezed
class CustomerModel with _$CustomerModel {
  const factory CustomerModel({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? image,
    String? fcm,
    double? point,
    String? authToken,
    String? created,
    String? updated,
  }) = _CustomerModel;

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);
}
