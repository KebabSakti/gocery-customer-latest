import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../model/core/query_model.dart';
import '../bloc/banner/banner_cubit.dart';
import '../bloc/bundle/bundle_cubit.dart';
import '../bloc/category/category_cubit.dart';
import '../bloc/product/product_cubit.dart';
import '../widget/bundle_item.dart';
import '../widget/cart_indicator.dart';
import '../widget/product_item.dart';
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
  final newProductBloc = ProductCubit();
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

    newProductBloc.load(
      option: QueryModel(
          paginate: QueryPaginate(limit: 10, offset: 0),
          sort: QuerySorting(
              field: 'created', direction: QuerySortingDirection.desc)),
    );

    bundleCubit.load();

    super.initState();
  }

  @override
  void dispose() {
    categoryBloc.close();
    bannerBloc.close();
    popularProductBloc.close();
    newProductBloc.close();
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
        actions: const [CartIndicator()],
      ),
      body: SingleChildScrollView(
        child: Column(
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
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 2.w),
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
              padding: EdgeInsets.symmetric(horizontal: 4.w),
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
                    height: 38.h,
                    child: BlocBuilder<ProductCubit, ProductState>(
                      bloc: popularProductBloc,
                      builder: (context, state) {
                        final popularProductLoading = ListView.separated(
                          physics: const BouncingScrollPhysics(
                              decelerationRate: ScrollDecelerationRate.fast),
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
                            physics: const BouncingScrollPhysics(
                                decelerationRate: ScrollDecelerationRate.fast),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.products.length,
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 2.w),
                            itemBuilder: (context, index) =>
                                ProductItem(product: state.products[index]),
                          );
                        }

                        return popularProductLoading;
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Baru Datang',
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
                    height: 38.h,
                    child: BlocBuilder<ProductCubit, ProductState>(
                      bloc: newProductBloc,
                      builder: (context, state) {
                        final newProductLoading = ListView.separated(
                          physics: const BouncingScrollPhysics(
                              decelerationRate: ScrollDecelerationRate.fast),
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
                          return newProductLoading;
                        }

                        if (state.products.isNotEmpty) {
                          return ListView.separated(
                            physics: const BouncingScrollPhysics(
                                decelerationRate: ScrollDecelerationRate.fast),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.products.length,
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 2.w),
                            itemBuilder: (context, index) =>
                                ProductItem(product: state.products[index]),
                          );
                        }

                        return newProductLoading;
                      },
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<BundleCubit, BundleState>(
              bloc: bundleCubit,
              builder: (context, state) {
                final bundleLoading = Padding(
                  padding: EdgeInsets.only(top: 2.h, left: 4.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ShimmerLoader(width: 30.w, height: 2.h),
                          ShimmerLoader(width: 30.w, height: 2.h),
                        ],
                      ),
                      SizedBox(height: 1.h),
                      ShimmerLoader(width: double.infinity, height: 2.h),
                      SizedBox(height: 1.h),
                      ShimmerLoader(width: double.infinity, height: 2.h),
                      SizedBox(height: 1.h),
                      SizedBox(
                        height: 38.h,
                        child: ListView.separated(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(
                              decelerationRate: ScrollDecelerationRate.fast),
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 2.w),
                          itemBuilder: (context, index) => ShimmerLoader(
                            width: 40.w,
                            radius: 4.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                );

                if (state.loading) {
                  return bundleLoading;
                }

                if (state.bundles.isNotEmpty) {
                  return Padding(
                    padding: EdgeInsets.only(top: 2.h, left: 4.w, right: 4.w),
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.bundles.length,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 2.h),
                      itemBuilder: (context, index) =>
                          BundleItem(bundle: state.bundles[index]),
                    ),
                  );
                }

                return bundleLoading;
              },
            ),
            SizedBox(height: 1.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: TextButton(
                onPressed: () {
                  //
                },
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100))),
                child: const Text('Lihat Semua Produk'),
              ),
            ),
            SizedBox(height: 1.h),
          ],
        ),
      ),
    );
  }
}
