import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../common/helper/utility.dart';
import '../../model/cart/cart_model.dart';
import '../../model/product/product_model.dart';
import '../bloc/cart/cart_cubit.dart';
import 'm_button.dart';
import 'shimmer_loader.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(4.w),
      child: Container(
        width: 40.w,
        color: theme.colorScheme.surface,
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: product.image!,
              fit: BoxFit.cover,
              height: 20.h,
              width: double.infinity,
              placeholder: (context, url) => const ShimmerLoader(),
            ),
            SizedBox(height: 1.h),
            Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.w),
                  child: Text(
                    product.name!,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: theme.colorScheme.onSurface,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      money(product.price!),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: theme.colorScheme.onSurface,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      product.unit!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: theme.colorScheme.onSurface,
                        fontSize: 8.sp,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      final cartItemIndex = state.cart.indexWhere(
                          (element) => element.productId == product.id);

                      if (cartItemIndex >= 0) {
                        final cartItem = state.cart[cartItemIndex];

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Material(
                              color: Colors.transparent,
                              child: GestureDetector(
                                onTap: () {
                                  context.read<CartCubit>().decrement(cartItem);
                                },
                                child: Ink(
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.primary,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(4.sp),
                                    child: Icon(
                                      Icons.remove,
                                      color: theme.colorScheme.onPrimary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                              child: Center(
                                child: Text(
                                  cartItem.qty.toString(),
                                  style: TextStyle(fontSize: 12.sp),
                                ),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: GestureDetector(
                                onTap: () {
                                  context.read<CartCubit>().increment(cartItem);
                                },
                                child: Ink(
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.primary,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(4.sp),
                                    child: Icon(
                                      Icons.add,
                                      color: theme.colorScheme.onPrimary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      return MButton(
                        size: 4.h,
                        color: theme.colorScheme.primary,
                        text: 'Beli',
                        textSize: 12.sp,
                        onPressed: () {
                          context.read<CartCubit>().increment(CartModel(
                              productId: product.id, price: product.price));
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
