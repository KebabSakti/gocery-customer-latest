// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
  String? get id => throw _privateConstructorUsedError;
  String? get invoice => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  bool? get cash => throw _privateConstructorUsedError;
  int? get qty => throw _privateConstructorUsedError;
  double? get billTotal => throw _privateConstructorUsedError;
  double? get deductorTotal => throw _privateConstructorUsedError;
  double? get payTotal => throw _privateConstructorUsedError;
  String? get created => throw _privateConstructorUsedError;
  String? get updated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) then) =
      _$OrderModelCopyWithImpl<$Res, OrderModel>;
  @useResult
  $Res call(
      {String? id,
      String? invoice,
      String? status,
      bool? cash,
      int? qty,
      double? billTotal,
      double? deductorTotal,
      double? payTotal,
      String? created,
      String? updated});
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? invoice = freezed,
    Object? status = freezed,
    Object? cash = freezed,
    Object? qty = freezed,
    Object? billTotal = freezed,
    Object? deductorTotal = freezed,
    Object? payTotal = freezed,
    Object? created = freezed,
    Object? updated = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      invoice: freezed == invoice
          ? _value.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      cash: freezed == cash
          ? _value.cash
          : cash // ignore: cast_nullable_to_non_nullable
              as bool?,
      qty: freezed == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int?,
      billTotal: freezed == billTotal
          ? _value.billTotal
          : billTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      deductorTotal: freezed == deductorTotal
          ? _value.deductorTotal
          : deductorTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      payTotal: freezed == payTotal
          ? _value.payTotal
          : payTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String?,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderModelCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$_OrderModelCopyWith(
          _$_OrderModel value, $Res Function(_$_OrderModel) then) =
      __$$_OrderModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? invoice,
      String? status,
      bool? cash,
      int? qty,
      double? billTotal,
      double? deductorTotal,
      double? payTotal,
      String? created,
      String? updated});
}

/// @nodoc
class __$$_OrderModelCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$_OrderModel>
    implements _$$_OrderModelCopyWith<$Res> {
  __$$_OrderModelCopyWithImpl(
      _$_OrderModel _value, $Res Function(_$_OrderModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? invoice = freezed,
    Object? status = freezed,
    Object? cash = freezed,
    Object? qty = freezed,
    Object? billTotal = freezed,
    Object? deductorTotal = freezed,
    Object? payTotal = freezed,
    Object? created = freezed,
    Object? updated = freezed,
  }) {
    return _then(_$_OrderModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      invoice: freezed == invoice
          ? _value.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      cash: freezed == cash
          ? _value.cash
          : cash // ignore: cast_nullable_to_non_nullable
              as bool?,
      qty: freezed == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int?,
      billTotal: freezed == billTotal
          ? _value.billTotal
          : billTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      deductorTotal: freezed == deductorTotal
          ? _value.deductorTotal
          : deductorTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      payTotal: freezed == payTotal
          ? _value.payTotal
          : payTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String?,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderModel implements _OrderModel {
  const _$_OrderModel(
      {this.id,
      this.invoice,
      this.status,
      this.cash,
      this.qty,
      this.billTotal,
      this.deductorTotal,
      this.payTotal,
      this.created,
      this.updated});

  factory _$_OrderModel.fromJson(Map<String, dynamic> json) =>
      _$$_OrderModelFromJson(json);

  @override
  final String? id;
  @override
  final String? invoice;
  @override
  final String? status;
  @override
  final bool? cash;
  @override
  final int? qty;
  @override
  final double? billTotal;
  @override
  final double? deductorTotal;
  @override
  final double? payTotal;
  @override
  final String? created;
  @override
  final String? updated;

  @override
  String toString() {
    return 'OrderModel(id: $id, invoice: $invoice, status: $status, cash: $cash, qty: $qty, billTotal: $billTotal, deductorTotal: $deductorTotal, payTotal: $payTotal, created: $created, updated: $updated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.invoice, invoice) || other.invoice == invoice) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.cash, cash) || other.cash == cash) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.billTotal, billTotal) ||
                other.billTotal == billTotal) &&
            (identical(other.deductorTotal, deductorTotal) ||
                other.deductorTotal == deductorTotal) &&
            (identical(other.payTotal, payTotal) ||
                other.payTotal == payTotal) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updated, updated) || other.updated == updated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, invoice, status, cash, qty,
      billTotal, deductorTotal, payTotal, created, updated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderModelCopyWith<_$_OrderModel> get copyWith =>
      __$$_OrderModelCopyWithImpl<_$_OrderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderModelToJson(
      this,
    );
  }
}

abstract class _OrderModel implements OrderModel {
  const factory _OrderModel(
      {final String? id,
      final String? invoice,
      final String? status,
      final bool? cash,
      final int? qty,
      final double? billTotal,
      final double? deductorTotal,
      final double? payTotal,
      final String? created,
      final String? updated}) = _$_OrderModel;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$_OrderModel.fromJson;

  @override
  String? get id;
  @override
  String? get invoice;
  @override
  String? get status;
  @override
  bool? get cash;
  @override
  int? get qty;
  @override
  double? get billTotal;
  @override
  double? get deductorTotal;
  @override
  double? get payTotal;
  @override
  String? get created;
  @override
  String? get updated;
  @override
  @JsonKey(ignore: true)
  _$$_OrderModelCopyWith<_$_OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}
