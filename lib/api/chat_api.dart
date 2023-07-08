import 'package:flutter/foundation.dart';

import '../common/config/const.dart';
import '../common/helper/network.dart';
import '../common/helper/utility.dart';
import '../model/chat/chat_room_model.dart';

class ChatApi {
  final _http = NetworkClient();

  Future<List<ChatRoomModel>> index({Map<String, dynamic>? option}) async {
    final request = await _http.get(chat, query: option);
    final json = await compute(parseJson, request.body);

    final chats = List<ChatRoomModel>.from(
        json.map((item) => ChatRoomModel.fromJson(item)));

    return chats;
  }
}
