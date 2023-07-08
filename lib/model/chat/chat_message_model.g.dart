// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatMessageModel _$$_ChatMessageModelFromJson(Map<String, dynamic> json) =>
    _$_ChatMessageModel(
      id: json['id'] as String?,
      message: json['message'] as String?,
      messageType: json['messageType'] as String?,
      memberType: json['memberType'] as String?,
      memberName: json['memberName'] as String?,
      memberPhone: json['memberPhone'] as String?,
      memberImage: json['memberImage'] as String?,
      created: json['created'] as String?,
      updated: json['updated'] as String?,
      read: json['read'] as bool?,
    );

Map<String, dynamic> _$$_ChatMessageModelToJson(_$_ChatMessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'messageType': instance.messageType,
      'memberType': instance.memberType,
      'memberName': instance.memberName,
      'memberPhone': instance.memberPhone,
      'memberImage': instance.memberImage,
      'created': instance.created,
      'updated': instance.updated,
      'read': instance.read,
    };
