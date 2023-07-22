import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
class OrderModel with _$OrderModel {
  const factory OrderModel({
    String? id,
    String? invoice,
    String? status,
    bool? cash,
    int? qty,
    double? billTotal,
    double? deductorTotal,
    double? payTotal,
    String? created,
    String? updated,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}
