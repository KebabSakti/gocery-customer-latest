// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductFilterModel _$$_ProductFilterModelFromJson(
        Map<String, dynamic> json) =>
    _$_ProductFilterModel(
      categoryId: json['categoryId'] as String?,
      name: json['name'] as String?,
      sorters: (json['sorters'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$ProductSorterEnumMap, e))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : PaginationModel.fromJson(
              json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProductFilterModelToJson(
        _$_ProductFilterModel instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'name': instance.name,
      'sorters':
          instance.sorters?.map((e) => _$ProductSorterEnumMap[e]!).toList(),
      'pagination': instance.pagination,
    };

const _$ProductSorterEnumMap = {
  ProductSorter.sold: 'sold',
};
