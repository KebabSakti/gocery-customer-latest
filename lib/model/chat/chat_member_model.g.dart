// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatMemberModel _$$_ChatMemberModelFromJson(Map<String, dynamic> json) =>
    _$_ChatMemberModel(
      id: json['id'] as String?,
      memberType: json['memberType'] as String?,
      memberName: json['memberName'] as String?,
      memberPhone: json['memberPhone'] as String?,
      memberImage: json['memberImage'] as String?,
    );

Map<String, dynamic> _$$_ChatMemberModelToJson(_$_ChatMemberModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'memberType': instance.memberType,
      'memberName': instance.memberName,
      'memberPhone': instance.memberPhone,
      'memberImage': instance.memberImage,
    };
