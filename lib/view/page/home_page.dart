import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gocery/view/bloc/banner/banner_cubit.dart';

import '../../common/config/const.dart';
import '../bloc/cart/cart_cubit.dart';
import '../bloc/category/category_cubit.dart';
import '../widget/shimmer_loader.dart';
import '../widget/widget_carousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final categoryBloc = CategoryCubit();
  final bannerBloc = BannerCubit();

  @override
  void initState() {
    categoryBloc.load();
    bannerBloc.load();

    super.initState();
  }

  @override
  void dispose() {
    categoryBloc.close();
    bannerBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.colorScheme.surface,
        title: Container(
          width: double.infinity,
          height: 36,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: theme.colorScheme.primary),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: small),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cari di sini',
                  style: TextStyle(
                    color: theme.colorScheme.onSurface,
                    fontSize: medium,
                  ),
                ),
                FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: theme.colorScheme.primary,
                  size: 20,
                )
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //
            },
            icon: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                final sum = state.cart.fold(0,
                    (previousValue, element) => previousValue + element.qty!);

                return badges.Badge(
                  showBadge: sum > 0,
                  position: badges.BadgePosition.topEnd(top: -12, end: -8),
                  badgeStyle:
                      badges.BadgeStyle(badgeColor: theme.colorScheme.primary),
                  badgeContent: Text(
                    sum.toString(),
                    style: TextStyle(
                      fontSize: small2x,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.cartShopping,
                    color: theme.colorScheme.onSurface,
                    size: 20,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: kToolbarHeight,
            width: double.infinity,
            color: theme.colorScheme.surface,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: medium),
              child: BlocBuilder<CategoryCubit, CategoryState>(
                bloc: categoryBloc,
                builder: (context, state) {
                  final categoryLoading = ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.only(right: 4),
                        child: Center(
                          child: ShimmerLoader(
                            width: 100,
                            radius: 100,
                            height: 35,
                          ),
                        ),
                      );
                    },
                  );

                  if (state.loading) {
                    return categoryLoading;
                  }

                  if (state.categories.isNotEmpty) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.categories.length,
                      itemBuilder: (context, index) {
                        final category = state.categories[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: InputChip(
                            onPressed: () {
                              //
                            },
                            backgroundColor: theme.colorScheme.primary,
                            elevation: 0,
                            pressElevation: 0,
                            label: Text(
                              category.name.toString(),
                              style: TextStyle(
                                color: theme.colorScheme.onPrimary,
                                fontSize: small,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }

                  return categoryLoading;
                },
              ),
            ),
          ),
          const SizedBox(height: medium),
          Container(
            width: double.infinity,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: medium),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(medium),
              child: BlocBuilder<BannerCubit, BannerState>(
                bloc: bannerBloc,
                builder: (context, state) {
                  const bannerLoading = ShimmerLoader();

                  if (state.loading) {
                    return bannerLoading;
                  }

                  if (state.banners.isNotEmpty) {
                    final bannerWidget = List.generate(
                      state.banners.length,
                      (index) => CachedNetworkImage(
                        imageUrl: state.banners[index].image!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                        placeholder: (context, url) => bannerLoading,
                      ),
                    );

                    return WidgetCarousel(children: bannerWidget);
                  }

                  return bannerLoading;
                },
              ),
            ),
          ),
          const SizedBox(height: medium),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: medium),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Paling Laku',
                      style: TextStyle(
                        color: theme.colorScheme.onBackground,
                        fontSize: medium,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Lihat Semua',
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontSize: medium,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: small),
                SizedBox(
                  height: 250,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: small),
                    itemBuilder: (context, index) {
                      return Container(
                        width: 150,
                        color: theme.colorScheme.onBackground,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Expanded(
//             child: BlocBuilder<CartCubit, CartState>(
//               builder: (context, state) {
//                 return Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     ElevatedButton(
//                         onPressed: () {
//                           if (state.cart.isNotEmpty) {
//                             context.read<CartCubit>().decrement(state.cart[0]);
//                           }
//                         },
//                         child: const Text('-')),
//                     Text(
//                       state.cart.isEmpty ? '0' : state.cart[0].qty.toString(),
//                       style: const TextStyle(
//                         fontSize: large3x,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                     ElevatedButton(
//                         onPressed: () {
//                           context.read<CartCubit>().increment(const CartModel(
//                                 productId:
//                                     '01dbc28d-c779-4ad9-afcd-78ba0a31fd7f',
//                                 price: 11181,
//                               ));
//                         },
//                         child: const Text('+')),
//                   ],
//                 );
//               },
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               context.read<AuthCubit>().signOut();
//               Navigator.of(context)
//                   .pushNamedAndRemoveUntil(authPage, (route) => false);
//             },
//             child: const Text('LOGOUT'),
//           ),