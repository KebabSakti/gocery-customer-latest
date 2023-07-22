// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderModel _$$_OrderModelFromJson(Map<String, dynamic> json) =>
    _$_OrderModel(
      id: json['id'] as String?,
      invoice: json['invoice'] as String?,
      status: json['status'] as String?,
      cash: json['cash'] as bool?,
      qty: json['qty'] as int?,
      billTotal: (json['billTotal'] as num?)?.toDouble(),
      deductorTotal: (json['deductorTotal'] as num?)?.toDouble(),
      payTotal: (json['payTotal'] as num?)?.toDouble(),
      created: json['created'] as String?,
      updated: json['updated'] as String?,
    );

Map<String, dynamic> _$$_OrderModelToJson(_$_OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoice': instance.invoice,
      'status': instance.status,
      'cash': instance.cash,
      'qty': instance.qty,
      'billTotal': instance.billTotal,
      'deductorTotal': instance.deductorTotal,
      'payTotal': instance.payTotal,
      'created': instance.created,
      'updated': instance.updated,
    };
