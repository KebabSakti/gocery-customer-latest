// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'option_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OptionModel _$OptionModelFromJson(Map<String, dynamic> json) {
  return _OptionModel.fromJson(json);
}

/// @nodoc
mixin _$OptionModel {
  Map<String, String>? get extra => throw _privateConstructorUsedError;
  PaginationModel? get pagination => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OptionModelCopyWith<OptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionModelCopyWith<$Res> {
  factory $OptionModelCopyWith(
          OptionModel value, $Res Function(OptionModel) then) =
      _$OptionModelCopyWithImpl<$Res, OptionModel>;
  @useResult
  $Res call({Map<String, String>? extra, PaginationModel? pagination});

  $PaginationModelCopyWith<$Res>? get pagination;
}

/// @nodoc
class _$OptionModelCopyWithImpl<$Res, $Val extends OptionModel>
    implements $OptionModelCopyWith<$Res> {
  _$OptionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extra = freezed,
    Object? pagination = freezed,
  }) {
    return _then(_value.copyWith(
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
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
abstract class _$$_OptionModelCopyWith<$Res>
    implements $OptionModelCopyWith<$Res> {
  factory _$$_OptionModelCopyWith(
          _$_OptionModel value, $Res Function(_$_OptionModel) then) =
      __$$_OptionModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, String>? extra, PaginationModel? pagination});

  @override
  $PaginationModelCopyWith<$Res>? get pagination;
}

/// @nodoc
class __$$_OptionModelCopyWithImpl<$Res>
    extends _$OptionModelCopyWithImpl<$Res, _$_OptionModel>
    implements _$$_OptionModelCopyWith<$Res> {
  __$$_OptionModelCopyWithImpl(
      _$_OptionModel _value, $Res Function(_$_OptionModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extra = freezed,
    Object? pagination = freezed,
  }) {
    return _then(_$_OptionModel(
      extra: freezed == extra
          ? _value._extra
          : extra // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OptionModel implements _OptionModel {
  const _$_OptionModel({final Map<String, String>? extra, this.pagination})
      : _extra = extra;

  factory _$_OptionModel.fromJson(Map<String, dynamic> json) =>
      _$$_OptionModelFromJson(json);

  final Map<String, String>? _extra;
  @override
  Map<String, String>? get extra {
    final value = _extra;
    if (value == null) return null;
    if (_extra is EqualUnmodifiableMapView) return _extra;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final PaginationModel? pagination;

  @override
  String toString() {
    return 'OptionModel(extra: $extra, pagination: $pagination)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OptionModel &&
            const DeepCollectionEquality().equals(other._extra, _extra) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_extra), pagination);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OptionModelCopyWith<_$_OptionModel> get copyWith =>
      __$$_OptionModelCopyWithImpl<_$_OptionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OptionModelToJson(
      this,
    );
  }
}

abstract class _OptionModel implements OptionModel {
  const factory _OptionModel(
      {final Map<String, String>? extra,
      final PaginationModel? pagination}) = _$_OptionModel;

  factory _OptionModel.fromJson(Map<String, dynamic> json) =
      _$_OptionModel.fromJson;

  @override
  Map<String, String>? get extra;
  @override
  PaginationModel? get pagination;
  @override
  @JsonKey(ignore: true)
  _$$_OptionModelCopyWith<_$_OptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
