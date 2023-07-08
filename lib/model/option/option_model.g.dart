// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OptionModel _$$_OptionModelFromJson(Map<String, dynamic> json) =>
    _$_OptionModel(
      extra: (json['extra'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      pagination: json['pagination'] == null
          ? null
          : PaginationModel.fromJson(
              json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_OptionModelToJson(_$_OptionModel instance) =>
    <String, dynamic>{
      'extra': instance.extra,
      'pagination': instance.pagination,
    };
