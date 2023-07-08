import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:socket_io_client/socket_io_client.dart';

import 'storage.dart';

class SIO {
  SIO._();

  static Socket? _socket;
  static final _storage = Storage();

  static Future<Socket> instance() async {
    if (_socket == null) {
      final uri =
          '${dotenv.env['SCHEME']}://${dotenv.env['HOST']}:${dotenv.env['PORT']!}';

      final token = await _storage.read('auth');

      _socket = io(
        uri,
        OptionBuilder().setTransports(['websocket']).setAuth(
          {'token': token, 'level': 'customer'},
        ).build(),
      );

      return _socket!;
    }

    return _socket!;
  }
}
