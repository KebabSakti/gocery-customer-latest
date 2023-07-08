// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_member_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatMemberModel _$ChatMemberModelFromJson(Map<String, dynamic> json) {
  return _ChatMemberModel.fromJson(json);
}

/// @nodoc
mixin _$ChatMemberModel {
  String? get id => throw _privateConstructorUsedError;
  String? get memberType => throw _privateConstructorUsedError;
  String? get memberName => throw _privateConstructorUsedError;
  String? get memberPhone => throw _privateConstructorUsedError;
  String? get memberImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatMemberModelCopyWith<ChatMemberModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMemberModelCopyWith<$Res> {
  factory $ChatMemberModelCopyWith(
          ChatMemberModel value, $Res Function(ChatMemberModel) then) =
      _$ChatMemberModelCopyWithImpl<$Res, ChatMemberModel>;
  @useResult
  $Res call(
      {String? id,
      String? memberType,
      String? memberName,
      String? memberPhone,
      String? memberImage});
}

/// @nodoc
class _$ChatMemberModelCopyWithImpl<$Res, $Val extends ChatMemberModel>
    implements $ChatMemberModelCopyWith<$Res> {
  _$ChatMemberModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? memberType = freezed,
    Object? memberName = freezed,
    Object? memberPhone = freezed,
    Object? memberImage = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      memberType: freezed == memberType
          ? _value.memberType
          : memberType // ignore: cast_nullable_to_non_nullable
              as String?,
      memberName: freezed == memberName
          ? _value.memberName
          : memberName // ignore: cast_nullable_to_non_nullable
              as String?,
      memberPhone: freezed == memberPhone
          ? _value.memberPhone
          : memberPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      memberImage: freezed == memberImage
          ? _value.memberImage
          : memberImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatMemberModelCopyWith<$Res>
    implements $ChatMemberModelCopyWith<$Res> {
  factory _$$_ChatMemberModelCopyWith(
          _$_ChatMemberModel value, $Res Function(_$_ChatMemberModel) then) =
      __$$_ChatMemberModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? memberType,
      String? memberName,
      String? memberPhone,
      String? memberImage});
}

/// @nodoc
class __$$_ChatMemberModelCopyWithImpl<$Res>
    extends _$ChatMemberModelCopyWithImpl<$Res, _$_ChatMemberModel>
    implements _$$_ChatMemberModelCopyWith<$Res> {
  __$$_ChatMemberModelCopyWithImpl(
      _$_ChatMemberModel _value, $Res Function(_$_ChatMemberModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? memberType = freezed,
    Object? memberName = freezed,
    Object? memberPhone = freezed,
    Object? memberImage = freezed,
  }) {
    return _then(_$_ChatMemberModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      memberType: freezed == memberType
          ? _value.memberType
          : memberType // ignore: cast_nullable_to_non_nullable
              as String?,
      memberName: freezed == memberName
          ? _value.memberName
          : memberName // ignore: cast_nullable_to_non_nullable
              as String?,
      memberPhone: freezed == memberPhone
          ? _value.memberPhone
          : memberPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      memberImage: freezed == memberImage
          ? _value.memberImage
          : memberImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatMemberModel implements _ChatMemberModel {
  const _$_ChatMemberModel(
      {this.id,
      this.memberType,
      this.memberName,
      this.memberPhone,
      this.memberImage});

  factory _$_ChatMemberModel.fromJson(Map<String, dynamic> json) =>
      _$$_ChatMemberModelFromJson(json);

  @override
  final String? id;
  @override
  final String? memberType;
  @override
  final String? memberName;
  @override
  final String? memberPhone;
  @override
  final String? memberImage;

  @override
  String toString() {
    return 'ChatMemberModel(id: $id, memberType: $memberType, memberName: $memberName, memberPhone: $memberPhone, memberImage: $memberImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatMemberModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.memberType, memberType) ||
                other.memberType == memberType) &&
            (identical(other.memberName, memberName) ||
                other.memberName == memberName) &&
            (identical(other.memberPhone, memberPhone) ||
                other.memberPhone == memberPhone) &&
            (identical(other.memberImage, memberImage) ||
                other.memberImage == memberImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, memberType, memberName, memberPhone, memberImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatMemberModelCopyWith<_$_ChatMemberModel> get copyWith =>
      __$$_ChatMemberModelCopyWithImpl<_$_ChatMemberModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatMemberModelToJson(
      this,
    );
  }
}

abstract class _ChatMemberModel implements ChatMemberModel {
  const factory _ChatMemberModel(
      {final String? id,
      final String? memberType,
      final String? memberName,
      final String? memberPhone,
      final String? memberImage}) = _$_ChatMemberModel;

  factory _ChatMemberModel.fromJson(Map<String, dynamic> json) =
      _$_ChatMemberModel.fromJson;

  @override
  String? get id;
  @override
  String? get memberType;
  @override
  String? get memberName;
  @override
  String? get memberPhone;
  @override
  String? get memberImage;
  @override
  @JsonKey(ignore: true)
  _$$_ChatMemberModelCopyWith<_$_ChatMemberModel> get copyWith =>
      throw _privateConstructorUsedError;
}
