import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/chat/chat_cubit.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    context.read<ChatCubit>().load();

    super.initState();
  }

  @override
  void dispose() {
    log('DESTROYED');

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            if (state.chats.isNotEmpty) {
              return Text(state.chats.toString());
            }

            return const Text('Loading..');
          },
        ),
      ),
    );
  }
}
