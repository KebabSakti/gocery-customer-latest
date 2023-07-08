part of 'chat_cubit.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    @Default(<ChatRoomModel>[]) List<ChatRoomModel> chats,
    @Default(false) bool loading,
    Exception? exception,
  }) = _ChatState;
}
