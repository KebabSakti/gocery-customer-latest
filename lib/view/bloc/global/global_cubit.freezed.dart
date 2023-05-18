// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'global_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GlobalState {
  ConfigModel get configModel => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  Exception? get exception => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GlobalStateCopyWith<GlobalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalStateCopyWith<$Res> {
  factory $GlobalStateCopyWith(
          GlobalState value, $Res Function(GlobalState) then) =
      _$GlobalStateCopyWithImpl<$Res, GlobalState>;
  @useResult
  $Res call({ConfigModel configModel, bool loading, Exception? exception});

  $ConfigModelCopyWith<$Res> get configModel;
}

/// @nodoc
class _$GlobalStateCopyWithImpl<$Res, $Val extends GlobalState>
    implements $GlobalStateCopyWith<$Res> {
  _$GlobalStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? configModel = null,
    Object? loading = null,
    Object? exception = freezed,
  }) {
    return _then(_value.copyWith(
      configModel: null == configModel
          ? _value.configModel
          : configModel // ignore: cast_nullable_to_non_nullable
              as ConfigModel,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ConfigModelCopyWith<$Res> get configModel {
    return $ConfigModelCopyWith<$Res>(_value.configModel, (value) {
      return _then(_value.copyWith(configModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GlobalStateCopyWith<$Res>
    implements $GlobalStateCopyWith<$Res> {
  factory _$$_GlobalStateCopyWith(
          _$_GlobalState value, $Res Function(_$_GlobalState) then) =
      __$$_GlobalStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ConfigModel configModel, bool loading, Exception? exception});

  @override
  $ConfigModelCopyWith<$Res> get configModel;
}

/// @nodoc
class __$$_GlobalStateCopyWithImpl<$Res>
    extends _$GlobalStateCopyWithImpl<$Res, _$_GlobalState>
    implements _$$_GlobalStateCopyWith<$Res> {
  __$$_GlobalStateCopyWithImpl(
      _$_GlobalState _value, $Res Function(_$_GlobalState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? configModel = null,
    Object? loading = null,
    Object? exception = freezed,
  }) {
    return _then(_$_GlobalState(
      configModel: null == configModel
          ? _value.configModel
          : configModel // ignore: cast_nullable_to_non_nullable
              as ConfigModel,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$_GlobalState implements _GlobalState {
  const _$_GlobalState(
      {this.configModel = const ConfigModel(),
      this.loading = false,
      this.exception});

  @override
  @JsonKey()
  final ConfigModel configModel;
  @override
  @JsonKey()
  final bool loading;
  @override
  final Exception? exception;

  @override
  String toString() {
    return 'GlobalState(configModel: $configModel, loading: $loading, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GlobalState &&
            (identical(other.configModel, configModel) ||
                other.configModel == configModel) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, configModel, loading, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GlobalStateCopyWith<_$_GlobalState> get copyWith =>
      __$$_GlobalStateCopyWithImpl<_$_GlobalState>(this, _$identity);
}

abstract class _GlobalState implements GlobalState {
  const factory _GlobalState(
      {final ConfigModel configModel,
      final bool loading,
      final Exception? exception}) = _$_GlobalState;

  @override
  ConfigModel get configModel;
  @override
  bool get loading;
  @override
  Exception? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_GlobalStateCopyWith<_$_GlobalState> get copyWith =>
      throw _privateConstructorUsedError;
}
