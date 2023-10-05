import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../bloc/cart/cart_cubit.dart';

class CartIndicator extends StatelessWidget {
  const CartIndicator({
    super.key,
    this.iconColor,
  });

  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton(
      onPressed: () {
        //
      },
      icon: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final sum = state.cart.fold(
              0, (previousValue, element) => previousValue + element.qty!);

          return badges.Badge(
            showBadge: sum > 0,
            position: badges.BadgePosition.topEnd(top: -12, end: -8),
            badgeStyle:
                badges.BadgeStyle(badgeColor: theme.colorScheme.primary),
            badgeContent: Text(
              sum.toString(),
              style: TextStyle(
                fontSize: 8.sp,
                color: theme.colorScheme.onPrimary,
              ),
            ),
            child: FaIcon(
              FontAwesomeIcons.cartShopping,
              color: iconColor ?? theme.colorScheme.onSurface,
              size: 15.sp,
            ),
          );
        },
      ),
    );
  }
}
