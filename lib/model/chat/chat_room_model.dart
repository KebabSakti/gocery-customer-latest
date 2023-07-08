import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gocery/model/chat/chat_message_model.dart';

import 'chat_member_model.dart';

part 'chat_room_model.freezed.dart';
part 'chat_room_model.g.dart';

@freezed
class ChatRoomModel with _$ChatRoomModel {
  const factory ChatRoomModel({
    String? id,
    int? ended,
    List<ChatMemberModel>? members,
    List<ChatMessageModel>? chats,
  }) = _CartRoomModel;

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomModelFromJson(json);
}
