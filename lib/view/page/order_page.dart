import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/config/const.dart';
import '../../common/helper/sio.dart';
import '../../common/helper/utility.dart';
import '../../model/cart/cart_model.dart';
import '../bloc/cart/cart_cubit.dart';

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
    return Scaffold(
      body: Center(
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (state.cart.isNotEmpty) {
                      context.read<CartCubit>().decrement(state.cart[0]);
                    }
                  },
                  child: const Text('-'),
                ),
                Text(
                  state.cart.isEmpty ? '0' : state.cart[0].qty.toString(),
                  style: const TextStyle(
                    fontSize: large3x,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<CartCubit>().increment(
                          const CartModel(
                            productId: '02582a13-f126-4d69-ae90-55242c7ad71c',
                            price: 11181,
                          ),
                        );
                  },
                  child: const Text('+'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
