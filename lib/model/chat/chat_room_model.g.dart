// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartRoomModel _$$_CartRoomModelFromJson(Map<String, dynamic> json) =>
    _$_CartRoomModel(
      id: json['id'] as String?,
      ended: json['ended'] as int?,
      members: (json['members'] as List<dynamic>?)
          ?.map((e) => ChatMemberModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      chats: (json['chats'] as List<dynamic>?)
          ?.map((e) => ChatMessageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CartRoomModelToJson(_$_CartRoomModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ended': instance.ended,
      'members': instance.members,
      'chats': instance.chats,
    };
