import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gocery/model/cart/cart_model.dart';
import 'package:sizer/sizer.dart';

import '../../common/config/const.dart';
import '../../model/core/query_model.dart';
import '../bloc/banner/banner_cubit.dart';
import '../bloc/bundle/bundle_cubit.dart';
import '../bloc/cart/cart_cubit.dart';
import '../bloc/category/category_cubit.dart';
import '../bloc/product/product_cubit.dart';
import '../widget/m_button.dart';
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
  final popularProductBloc = ProductCubit();
  final bundleCubit = BundleCubit();

  @override
  void initState() {
    categoryBloc.load();
    bannerBloc.load();

    popularProductBloc.load(
      option: QueryModel(
          paginate: QueryPaginate(limit: 10, offset: 0),
          sort: QuerySorting(
              field: 'sold', direction: QuerySortingDirection.desc)),
    );

    bundleCubit.load();

    super.initState();
  }

  @override
  void dispose() {
    categoryBloc.close();
    bannerBloc.close();
    popularProductBloc.close();
    bundleCubit.close();

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
          height: 4.5.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: theme.colorScheme.primary),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cari di sini',
                  style: TextStyle(
                    color: theme.colorScheme.onSurface,
                    fontSize: 12.sp,
                  ),
                ),
                FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: theme.colorScheme.primary,
                  size: 15.sp,
                ),
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
                    size: 15.sp,
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
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: BlocBuilder<CategoryCubit, CategoryState>(
                bloc: categoryBloc,
                builder: (context, state) {
                  final categoryLoading = ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    separatorBuilder: (context, index) => SizedBox(width: 2.w),
                    itemBuilder: (context, index) {
                      return Center(
                        child: ShimmerLoader(
                          width: 20.w,
                          height: 4.h,
                          radius: 100,
                        ),
                      );
                    },
                  );

                  if (state.loading) {
                    return categoryLoading;
                  }

                  if (state.categories.isNotEmpty) {
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.categories.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 2.w),
                      itemBuilder: (context, index) {
                        final category = state.categories[index];
                        return Center(
                          child: Container(
                            height: 4.h,
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary,
                              borderRadius: BorderRadius.circular(100.sp),
                            ),
                            child: Center(
                              child: Text(
                                category.name.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: theme.colorScheme.onPrimary,
                                  fontSize: 12.sp,
                                ),
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
          SizedBox(height: 2.h),
          Container(
            width: double.infinity,
            height: 20.h,
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.w),
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
          SizedBox(height: 2.h),
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
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Lihat Semua',
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                SizedBox(
                  height: 40.h,
                  child: BlocBuilder<ProductCubit, ProductState>(
                    bloc: popularProductBloc,
                    builder: (context, state) {
                      final popularProductLoading = ListView.separated(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 2.w),
                        itemBuilder: (context, index) => ShimmerLoader(
                          width: 40.w,
                          radius: 4.w,
                        ),
                      );

                      if (state.loading) {
                        return popularProductLoading;
                      }

                      if (state.products.isNotEmpty) {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 2.w),
                          itemBuilder: (context, index) {
                            final popularProduct = state.products[index];

                            return ClipRRect(
                              borderRadius: BorderRadius.circular(4.w),
                              child: Container(
                                width: 40.w,
                                color: theme.colorScheme.surface,
                                child: Column(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: popularProduct.image!,
                                      fit: BoxFit.cover,
                                      height: 20.h,
                                      width: double.infinity,
                                      placeholder: (context, url) =>
                                          const ShimmerLoader(),
                                    ),
                                    SizedBox(height: 1.h),
                                    Text(
                                      popularProduct.name!,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: theme.colorScheme.onSurface,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      popularProduct.price!.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: theme.colorScheme.onSurface,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      popularProduct.unit!,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: theme.colorScheme.onSurface,
                                        fontSize: 8.sp,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 4.w,
                                        vertical: 1.h,
                                      ),
                                      child: BlocBuilder<CartCubit, CartState>(
                                        builder: (context, state) {
                                          final index = state.cart.indexWhere(
                                              (element) =>
                                                  element.productId ==
                                                  popularProduct.id);

                                          if (index >= 0) {
                                            final cartItem = state.cart[index];

                                            return Row(
                                              key: UniqueKey(),
                                              children: [
                                                Expanded(
                                                  key: UniqueKey(),
                                                  child: MButton(
                                                    size: 4.h,
                                                    color: theme
                                                        .colorScheme.primary,
                                                    text: '-',
                                                    textSize: 14.sp,
                                                    onPressed: () {
                                                      context
                                                          .read<CartCubit>()
                                                          .decrement(cartItem);
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                  key: UniqueKey(),
                                                  width: 10.w,
                                                  child: Center(
                                                    child: Text(
                                                      cartItem.qty.toString(),
                                                      style: TextStyle(
                                                          fontSize: 12.sp),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  key: UniqueKey(),
                                                  child: MButton(
                                                    size: 4.h,
                                                    color: theme
                                                        .colorScheme.primary,
                                                    text: '+',
                                                    textSize: 14.sp,
                                                    onPressed: () {
                                                      context
                                                          .read<CartCubit>()
                                                          .increment(cartItem);
                                                    },
                                                  ),
                                                ),
                                              ],
                                            );
                                          }

                                          return MButton(
                                            key: UniqueKey(),
                                            size: 4.h,
                                            color: theme.colorScheme.primary,
                                            text: 'Beli',
                                            textSize: 12.sp,
                                            onPressed: () {
                                              context
                                                  .read<CartCubit>()
                                                  .increment(CartModel(
                                                      productId:
                                                          popularProduct.id));
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }

                      return popularProductLoading;
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
