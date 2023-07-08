// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatRoomModel _$ChatRoomModelFromJson(Map<String, dynamic> json) {
  return _CartRoomModel.fromJson(json);
}

/// @nodoc
mixin _$ChatRoomModel {
  String? get id => throw _privateConstructorUsedError;
  int? get ended => throw _privateConstructorUsedError;
  List<ChatMemberModel>? get members => throw _privateConstructorUsedError;
  List<ChatMessageModel>? get chats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatRoomModelCopyWith<ChatRoomModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomModelCopyWith<$Res> {
  factory $ChatRoomModelCopyWith(
          ChatRoomModel value, $Res Function(ChatRoomModel) then) =
      _$ChatRoomModelCopyWithImpl<$Res, ChatRoomModel>;
  @useResult
  $Res call(
      {String? id,
      int? ended,
      List<ChatMemberModel>? members,
      List<ChatMessageModel>? chats});
}

/// @nodoc
class _$ChatRoomModelCopyWithImpl<$Res, $Val extends ChatRoomModel>
    implements $ChatRoomModelCopyWith<$Res> {
  _$ChatRoomModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? ended = freezed,
    Object? members = freezed,
    Object? chats = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      ended: freezed == ended
          ? _value.ended
          : ended // ignore: cast_nullable_to_non_nullable
              as int?,
      members: freezed == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<ChatMemberModel>?,
      chats: freezed == chats
          ? _value.chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<ChatMessageModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CartRoomModelCopyWith<$Res>
    implements $ChatRoomModelCopyWith<$Res> {
  factory _$$_CartRoomModelCopyWith(
          _$_CartRoomModel value, $Res Function(_$_CartRoomModel) then) =
      __$$_CartRoomModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      int? ended,
      List<ChatMemberModel>? members,
      List<ChatMessageModel>? chats});
}

/// @nodoc
class __$$_CartRoomModelCopyWithImpl<$Res>
    extends _$ChatRoomModelCopyWithImpl<$Res, _$_CartRoomModel>
    implements _$$_CartRoomModelCopyWith<$Res> {
  __$$_CartRoomModelCopyWithImpl(
      _$_CartRoomModel _value, $Res Function(_$_CartRoomModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? ended = freezed,
    Object? members = freezed,
    Object? chats = freezed,
  }) {
    return _then(_$_CartRoomModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      ended: freezed == ended
          ? _value.ended
          : ended // ignore: cast_nullable_to_non_nullable
              as int?,
      members: freezed == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<ChatMemberModel>?,
      chats: freezed == chats
          ? _value._chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<ChatMessageModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CartRoomModel implements _CartRoomModel {
  const _$_CartRoomModel(
      {this.id,
      this.ended,
      final List<ChatMemberModel>? members,
      final List<ChatMessageModel>? chats})
      : _members = members,
        _chats = chats;

  factory _$_CartRoomModel.fromJson(Map<String, dynamic> json) =>
      _$$_CartRoomModelFromJson(json);

  @override
  final String? id;
  @override
  final int? ended;
  final List<ChatMemberModel>? _members;
  @override
  List<ChatMemberModel>? get members {
    final value = _members;
    if (value == null) return null;
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ChatMessageModel>? _chats;
  @override
  List<ChatMessageModel>? get chats {
    final value = _chats;
    if (value == null) return null;
    if (_chats is EqualUnmodifiableListView) return _chats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ChatRoomModel(id: $id, ended: $ended, members: $members, chats: $chats)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartRoomModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ended, ended) || other.ended == ended) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            const DeepCollectionEquality().equals(other._chats, _chats));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      ended,
      const DeepCollectionEquality().hash(_members),
      const DeepCollectionEquality().hash(_chats));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartRoomModelCopyWith<_$_CartRoomModel> get copyWith =>
      __$$_CartRoomModelCopyWithImpl<_$_CartRoomModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CartRoomModelToJson(
      this,
    );
  }
}

abstract class _CartRoomModel implements ChatRoomModel {
  const factory _CartRoomModel(
      {final String? id,
      final int? ended,
      final List<ChatMemberModel>? members,
      final List<ChatMessageModel>? chats}) = _$_CartRoomModel;

  factory _CartRoomModel.fromJson(Map<String, dynamic> json) =
      _$_CartRoomModel.fromJson;

  @override
  String? get id;
  @override
  int? get ended;
  @override
  List<ChatMemberModel>? get members;
  @override
  List<ChatMessageModel>? get chats;
  @override
  @JsonKey(ignore: true)
  _$$_CartRoomModelCopyWith<_$_CartRoomModel> get copyWith =>
      throw _privateConstructorUsedError;
}
