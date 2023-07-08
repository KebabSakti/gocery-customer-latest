import 'package:flutter/material.dart';

import '../../common/helper/sio.dart';
import '../../common/helper/utility.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  Future<void> _init() async {
    final socket = await SIO.instance();
    final roomId = uuid();

    socket.emit('room:create', {'id': roomId});
    socket.emit('room:join', {'roomId': roomId});
    socket.emit('chat', {'roomId': roomId, 'message': 'Hello from AL'});
  }

  @override
  void initState() {
    _init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('ORDER'),
      ),
    );
  }
}
