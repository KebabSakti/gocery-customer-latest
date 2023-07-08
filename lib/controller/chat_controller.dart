import '../api/chat_api.dart';
import '../model/chat/chat_room_model.dart';

class ChatController {
  final _chatApi = ChatApi();

  Future<List<ChatRoomModel>> index({Map<String, dynamic>? option}) async {
    final chats = await _chatApi.index(option: option);

    return chats;
  }
}
