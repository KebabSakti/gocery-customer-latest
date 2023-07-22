// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bundle_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BundleState {
  List<BundleModel> get bundles => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  Exception? get exception => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BundleStateCopyWith<BundleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BundleStateCopyWith<$Res> {
  factory $BundleStateCopyWith(
          BundleState value, $Res Function(BundleState) then) =
      _$BundleStateCopyWithImpl<$Res, BundleState>;
  @useResult
  $Res call({List<BundleModel> bundles, bool loading, Exception? exception});
}

/// @nodoc
class _$BundleStateCopyWithImpl<$Res, $Val extends BundleState>
    implements $BundleStateCopyWith<$Res> {
  _$BundleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bundles = null,
    Object? loading = null,
    Object? exception = freezed,
  }) {
    return _then(_value.copyWith(
      bundles: null == bundles
          ? _value.bundles
          : bundles // ignore: cast_nullable_to_non_nullable
              as List<BundleModel>,
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
}

/// @nodoc
abstract class _$$_BundleStateCopyWith<$Res>
    implements $BundleStateCopyWith<$Res> {
  factory _$$_BundleStateCopyWith(
          _$_BundleState value, $Res Function(_$_BundleState) then) =
      __$$_BundleStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BundleModel> bundles, bool loading, Exception? exception});
}

/// @nodoc
class __$$_BundleStateCopyWithImpl<$Res>
    extends _$BundleStateCopyWithImpl<$Res, _$_BundleState>
    implements _$$_BundleStateCopyWith<$Res> {
  __$$_BundleStateCopyWithImpl(
      _$_BundleState _value, $Res Function(_$_BundleState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bundles = null,
    Object? loading = null,
    Object? exception = freezed,
  }) {
    return _then(_$_BundleState(
      bundles: null == bundles
          ? _value._bundles
          : bundles // ignore: cast_nullable_to_non_nullable
              as List<BundleModel>,
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

class _$_BundleState implements _BundleState {
  const _$_BundleState(
      {final List<BundleModel> bundles = const [],
      this.loading = false,
      this.exception})
      : _bundles = bundles;

  final List<BundleModel> _bundles;
  @override
  @JsonKey()
  List<BundleModel> get bundles {
    if (_bundles is EqualUnmodifiableListView) return _bundles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bundles);
  }

  @override
  @JsonKey()
  final bool loading;
  @override
  final Exception? exception;

  @override
  String toString() {
    return 'BundleState(bundles: $bundles, loading: $loading, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BundleState &&
            const DeepCollectionEquality().equals(other._bundles, _bundles) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_bundles), loading, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BundleStateCopyWith<_$_BundleState> get copyWith =>
      __$$_BundleStateCopyWithImpl<_$_BundleState>(this, _$identity);
}

abstract class _BundleState implements BundleState {
  const factory _BundleState(
      {final List<BundleModel> bundles,
      final bool loading,
      final Exception? exception}) = _$_BundleState;

  @override
  List<BundleModel> get bundles;
  @override
  bool get loading;
  @override
  Exception? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_BundleStateCopyWith<_$_BundleState> get copyWith =>
      throw _privateConstructorUsedError;
}
