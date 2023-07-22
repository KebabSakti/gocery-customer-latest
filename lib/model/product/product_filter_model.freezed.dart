// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_filter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductFilterModel _$ProductFilterModelFromJson(Map<String, dynamic> json) {
  return _ProductFilterModel.fromJson(json);
}

/// @nodoc
mixin _$ProductFilterModel {
  String? get categoryId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  List<ProductSorter>? get sorters => throw _privateConstructorUsedError;
  PaginationModel? get pagination => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductFilterModelCopyWith<ProductFilterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductFilterModelCopyWith<$Res> {
  factory $ProductFilterModelCopyWith(
          ProductFilterModel value, $Res Function(ProductFilterModel) then) =
      _$ProductFilterModelCopyWithImpl<$Res, ProductFilterModel>;
  @useResult
  $Res call(
      {String? categoryId,
      String? name,
      List<ProductSorter>? sorters,
      PaginationModel? pagination});

  $PaginationModelCopyWith<$Res>? get pagination;
}

/// @nodoc
class _$ProductFilterModelCopyWithImpl<$Res, $Val extends ProductFilterModel>
    implements $ProductFilterModelCopyWith<$Res> {
  _$ProductFilterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? name = freezed,
    Object? sorters = freezed,
    Object? pagination = freezed,
  }) {
    return _then(_value.copyWith(
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      sorters: freezed == sorters
          ? _value.sorters
          : sorters // ignore: cast_nullable_to_non_nullable
              as List<ProductSorter>?,
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationModelCopyWith<$Res>? get pagination {
    if (_value.pagination == null) {
      return null;
    }

    return $PaginationModelCopyWith<$Res>(_value.pagination!, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProductFilterModelCopyWith<$Res>
    implements $ProductFilterModelCopyWith<$Res> {
  factory _$$_ProductFilterModelCopyWith(_$_ProductFilterModel value,
          $Res Function(_$_ProductFilterModel) then) =
      __$$_ProductFilterModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? categoryId,
      String? name,
      List<ProductSorter>? sorters,
      PaginationModel? pagination});

  @override
  $PaginationModelCopyWith<$Res>? get pagination;
}

/// @nodoc
class __$$_ProductFilterModelCopyWithImpl<$Res>
    extends _$ProductFilterModelCopyWithImpl<$Res, _$_ProductFilterModel>
    implements _$$_ProductFilterModelCopyWith<$Res> {
  __$$_ProductFilterModelCopyWithImpl(
      _$_ProductFilterModel _value, $Res Function(_$_ProductFilterModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? name = freezed,
    Object? sorters = freezed,
    Object? pagination = freezed,
  }) {
    return _then(_$_ProductFilterModel(
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      sorters: freezed == sorters
          ? _value._sorters
          : sorters // ignore: cast_nullable_to_non_nullable
              as List<ProductSorter>?,
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductFilterModel implements _ProductFilterModel {
  const _$_ProductFilterModel(
      {this.categoryId,
      this.name,
      final List<ProductSorter>? sorters,
      this.pagination})
      : _sorters = sorters;

  factory _$_ProductFilterModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProductFilterModelFromJson(json);

  @override
  final String? categoryId;
  @override
  final String? name;
  final List<ProductSorter>? _sorters;
  @override
  List<ProductSorter>? get sorters {
    final value = _sorters;
    if (value == null) return null;
    if (_sorters is EqualUnmodifiableListView) return _sorters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final PaginationModel? pagination;

  @override
  String toString() {
    return 'ProductFilterModel(categoryId: $categoryId, name: $name, sorters: $sorters, pagination: $pagination)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductFilterModel &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._sorters, _sorters) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, categoryId, name,
      const DeepCollectionEquality().hash(_sorters), pagination);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductFilterModelCopyWith<_$_ProductFilterModel> get copyWith =>
      __$$_ProductFilterModelCopyWithImpl<_$_ProductFilterModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductFilterModelToJson(
      this,
    );
  }
}

abstract class _ProductFilterModel implements ProductFilterModel {
  const factory _ProductFilterModel(
      {final String? categoryId,
      final String? name,
      final List<ProductSorter>? sorters,
      final PaginationModel? pagination}) = _$_ProductFilterModel;

  factory _ProductFilterModel.fromJson(Map<String, dynamic> json) =
      _$_ProductFilterModel.fromJson;

  @override
  String? get categoryId;
  @override
  String? get name;
  @override
  List<ProductSorter>? get sorters;
  @override
  PaginationModel? get pagination;
  @override
  @JsonKey(ignore: true)
  _$$_ProductFilterModelCopyWith<_$_ProductFilterModel> get copyWith =>
      throw _privateConstructorUsedError;
}
