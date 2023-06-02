// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      id: json['id'] as String?,
      categoryId: json['categoryId'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      point: (json['point'] as num?)?.toDouble(),
      price: (json['price'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
      stok: json['stok'] as int?,
      max: json['max'] as int?,
      min: json['min'] as int?,
      sold: json['sold'] as int?,
      view: json['view'] as int?,
      like: json['like'] as int?,
      created: json['created'] as String?,
      updated: json['updated'] as String?,
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'point': instance.point,
      'price': instance.price,
      'unit': instance.unit,
      'stok': instance.stok,
      'max': instance.max,
      'min': instance.min,
      'sold': instance.sold,
      'view': instance.view,
      'like': instance.like,
      'created': instance.created,
      'updated': instance.updated,
    };
