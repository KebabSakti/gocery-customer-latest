import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_member_model.freezed.dart';
part 'chat_member_model.g.dart';

@freezed
class ChatMemberModel with _$ChatMemberModel {
  const factory ChatMemberModel({
    String? id,
    String? memberType,
    String? memberName,
    String? memberPhone,
    String? memberImage,
  }) = _ChatMemberModel;

  factory ChatMemberModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMemberModelFromJson(json);
}
