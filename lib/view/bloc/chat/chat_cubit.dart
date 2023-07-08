import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../../../common/helper/sio.dart';
import '../../../controller/chat_controller.dart';
import '../../../model/chat/chat_room_model.dart';

part 'chat_cubit.freezed.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(const ChatState());

  final _chatController = ChatController();

  Future<void> init() async {
    final socket = await SIO.instance();

    socket.onConnect((_) {
      socket.on('message', (data) {
        log(data.toString());
      });
    });

    await load();
  }

  Future<void> load() async {
    try {
      emit(const ChatState(loading: true));

      final chats =
          await _chatController.index(option: {'current': 1, 'limit': 5});

      emit(ChatState(chats: chats));
    } on Exception catch (e) {
      emit(state.copyWith(loading: false, exception: e));
    }
  }
}
